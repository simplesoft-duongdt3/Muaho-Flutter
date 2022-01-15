import '../models/gift_management.dart';
import '../../domain/entity/gift_management.dart';

class GiftManagementMapper {

  GiftManagementEntity map(GiftManagementResponse? giftManagementResponse) {
    return GiftManagementEntity(
      id: giftManagementResponse?.id ?? '',
    );
  }
}
