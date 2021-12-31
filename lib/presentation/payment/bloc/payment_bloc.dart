import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muaho/domain/domain.dart';
import 'package:muaho/domain/models/payment/payment_entity.dart';
import 'package:muaho/presentation/cart_update_bloc/cart_update_bloc.dart';
import 'package:muaho/presentation/payment/model/payment_info.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CartUpdateBloc cartUpdateBloc;
  final CreateOrderUseCase createOrderUseCase;

  PaymentBloc({
    required this.createOrderUseCase,
    required this.cartUpdateBloc,
  }) : super(PaymentInitial()) {
    on<CreateOrderEvent>((event, emit) async {
      await _handleCreateOrderEvent(event, emit);
    });
    on<UpdateAddressEvent>((event, emit) async {
      await _handleUpdateAddressEvent(event, emit);
    });
  }

  Future<void> _handleCreateOrderEvent(
      CreateOrderEvent event, Emitter<PaymentState> emit) async {
    if (event.paymentEntity.productEntities.isNotEmpty) {
      Either<Failure, OrderStatusResult> result =
          await createOrderUseCase.execute(event.paymentEntity);
      emit(CreatingOrder());
      if (result.isSuccess) {
        cartUpdateBloc.cartStore.createOrderSuccess();
        await Future.delayed(Duration(seconds: 1));
        emit(CreateOrderSuccess(orderId: result.success.orderID));
      } else {
        emit(CreateOrderFailed());
      }
    }
  }

  Future<void> _handleUpdateAddressEvent(
      UpdateAddressEvent event, Emitter<PaymentState> emit) async {
    cartUpdateBloc.cartStore.updateAddressInfo(event.addressInfoEntity);
  }
}
