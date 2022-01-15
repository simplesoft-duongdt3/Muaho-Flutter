import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muaho/domain/common/either.dart';
import 'package:muaho/domain/common/failure.dart';
import 'package:muaho/features/gift_management/domain/entity/gift_management.dart';
import 'package:muaho/features/gift_management/domain/usecase/get_gift_management_usecase.dart';

part 'gift_management_event.dart';

part 'gift_management_state.dart';

class GiftManagementBloc
    extends Bloc<GiftManagementEvent, GiftManagementState> {
  final GetGiftManagementUseCase getGiftManagementUseCase;

  GiftManagementBloc({
    required this.getGiftManagementUseCase,
  }) : super(GiftManagementInitial()) {
    on<RequestGiftManagementEvent>((event, emit) async {
      await _handleRequestGiftManagementEvent(event, emit);
    });
  }

  Future _handleRequestGiftManagementEvent(RequestGiftManagementEvent event,
      Emitter<GiftManagementState> emit) async {
    Either<Failure, GiftManagementEntity> result =
        await getGiftManagementUseCase.execute(
      GetGiftManagementUseCaseParams(),
    );

    if (result.isSuccess) {
      GiftManagementEntity giftManagementEntity = result.success;
      emit(SuccessRenderState(
        giftManagementEntity: giftManagementEntity,
      ));
    }
  }
}

//<editor-fold desc="GiftManagementEvent internal event classes">
//todo add some internal event here
//</editor-fold>
