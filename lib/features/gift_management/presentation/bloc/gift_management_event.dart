part of 'gift_management_bloc.dart';

abstract class GiftManagementEvent extends Equatable {
  const GiftManagementEvent();
}

abstract class RequestGiftManagementEvent extends GiftManagementEvent {
  const RequestGiftManagementEvent();
}