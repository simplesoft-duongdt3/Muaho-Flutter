part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class LoadingState extends PaymentState {}

class GetPaymentInfoSuccess extends PaymentState {
  final PaymentInfoModel paymentInfoModel;

  GetPaymentInfoSuccess({required this.paymentInfoModel});
}

class CreateOrderSuccess extends PaymentState {}

class CreateOrderFailed extends PaymentState {}
