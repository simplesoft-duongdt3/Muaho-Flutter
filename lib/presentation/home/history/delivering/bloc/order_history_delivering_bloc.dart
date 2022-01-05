import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:muaho/common/common.dart';
import 'package:muaho/domain/domain.dart';
import 'package:muaho/presentation/home/history/models/order_history_delivering_model.dart';
import 'package:muaho/presentation/payment/bloc/payment_bloc.dart';

part 'order_history_delivering_event.dart';
part 'order_history_delivering_state.dart';

class _ReloadOrderDeliveringEvent extends OrderHistoryDeliveringEvent {
  @override
  List<Object?> get props => [];
}

class OrderHistoryDeliveringBloc
    extends Bloc<OrderHistoryDeliveringEvent, OrderHistoryDeliveringState> {
  final GetOrderHistoryDeliveryUseCase getOrderHistoryDeliveryUseCase;
  final AppEventBus appEventBus;
  StreamSubscription<CreateOrderSuccessEventBus>?
      createOrderSuccessStreamSubscription;

  OrderHistoryDeliveringBloc({
    required this.getOrderHistoryDeliveryUseCase,
    required this.appEventBus,
  }) : super(OrderHistoryDeliveringInitial()) {
    createOrderSuccessStreamSubscription =
        appEventBus.on<CreateOrderSuccessEventBus>().listen((event) {
      this.add(_ReloadOrderDeliveringEvent());
    });

    on<GetOrderHistoryDeliveringEvent>((event, emit) async {
      await _handleGetOrderDelivering(emit);
    });

    on<_ReloadOrderDeliveringEvent>((event, emit) async {
      await _handleGetOrderDelivering(emit);
    });
  }

  Future _handleGetOrderDelivering(
    Emitter<OrderHistoryDeliveringState> emit,
  ) async {
    emit(OrderHistoryDeliveringLoading());
    Either<Failure, List<OrderHistoryDelivering>> result =
        await getOrderHistoryDeliveryUseCase.execute(EmptyInput());
    if (result.isSuccess) {
      OrderHistoryDeliveringSuccess orderHistoryDeliveringSuccess =
          OrderHistoryDeliveringSuccess(
        orderHistoryDeliveries: result.success
            .map(
              (e) => OrderHistoryDeliveringModel(
                  orderID: e.orderId,
                  shopName: e.shopName,
                  subText: "${e.itemCount} Đơn vị - ${e.status}",
                  totalPrice: e.total.format() + " VNĐ"),
            )
            .toList(),
      );

      emit(orderHistoryDeliveringSuccess);
    } else {
      emit(OrderHistoryDeliveringError());
    }
  }

  @override
  Future<void> close() {
    createOrderSuccessStreamSubscription?.cancel();
    return super.close();
  }
}
