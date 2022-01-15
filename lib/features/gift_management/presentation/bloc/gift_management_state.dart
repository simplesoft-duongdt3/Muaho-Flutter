part of 'gift_management_bloc.dart';

//<editor-fold desc="GiftManagementState base classes">

abstract class GiftManagementState extends Equatable {
  const GiftManagementState();
}

abstract class GiftManagementRenderState extends GiftManagementState {
  const GiftManagementRenderState();
}

abstract class GiftManagementActionState extends GiftManagementState {
  const GiftManagementActionState();
}

//</editor-fold>

class GiftManagementInitial extends GiftManagementState {
  @override
  List<Object> get props => [];
}

//<editor-fold desc="GiftManagementState render state classes">
class LoadingRenderState extends GiftManagementRenderState {
  @override
  List<Object?> get props => [];
}

class ErrorRenderState extends GiftManagementRenderState {
  @override
  List<Object?> get props => [];
}

class SuccessRenderState extends GiftManagementRenderState {
  final GiftManagementEntity giftManagementEntity;

  const SuccessRenderState({
    required this.giftManagementEntity,
  });

  @override
  List<Object?> get props => [
        giftManagementEntity,
      ];
}

//</editor-fold>

//<editor-fold desc="GiftManagementState action state classes">
//todo add some action state here, ex: GoToProfileActionState
//</editor-fold>
