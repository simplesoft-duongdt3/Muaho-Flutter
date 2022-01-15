import '../../../../domain/domain.dart';
import '../entity/gift_management.dart';

abstract class GiftManagementRepo {
  Future<Either<Failure, GiftManagementEntity>> getGiftManagement();
}