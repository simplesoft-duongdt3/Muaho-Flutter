import '../../../../common/extensions/network.dart';
import '../../../../domain/domain.dart';

import '../../domain/entity/gift_management.dart';
import '../../domain/repo/gift_management_repo.dart';

import '../services/gift_management_service.dart';
import '../models/gift_management.dart';
import '../mapper/gift_management_mapper.dart';

class GiftManagementRepoImpl extends GiftManagementRepo {
  final GiftManagementService giftManagementService;
  final GiftManagementMapper giftManagementMapper;

  GiftManagementRepoImpl({
    required this.giftManagementService,
    required this.giftManagementMapper,
  });

  @override
  Future<Either<Failure, GiftManagementEntity>> getGiftManagement() async {
    var request = giftManagementService.getGiftManagement();
    NetworkResult<GiftManagementResponse> result = await handleNetworkResult(request);
    if (result.isSuccess()) {
      var response = result.response;
      return SuccessValue(
          giftManagementMapper.map(response)
      );
    } else {
      return FailValue(
        ServerError(msg: result.error, errorCode: result.errorCode),
      );
    }
  }
}
