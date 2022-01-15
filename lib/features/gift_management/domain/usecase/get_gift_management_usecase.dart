import 'package:equatable/equatable.dart';
import '../../../../domain/domain.dart';

import '../entity/gift_management.dart';
import '../repo/gift_management_repo.dart';

class GetGiftManagementUseCase
    extends BaseUseCase<GetGiftManagementUseCaseParams, GiftManagementEntity> {
  final GiftManagementRepo giftManagementRepo;

  GetGiftManagementUseCase({
    required this.giftManagementRepo,
  });

  @override
  Future<Either<Failure, GiftManagementEntity>> executeInternal(GetGiftManagementUseCaseParams input) {
    return giftManagementRepo.getGiftManagement();
  }
}

class GetGiftManagementUseCaseParams extends Equatable {

  @override
  List<Object?> get props => [];
}