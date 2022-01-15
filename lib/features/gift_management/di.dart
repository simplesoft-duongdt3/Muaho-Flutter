import 'package:get_it/get_it.dart';

import 'data/services/gift_management_service.dart';
import 'data/mapper/gift_management_mapper.dart';
import 'data/repo/gift_management_repo_impl.dart';
import 'domain/repo/gift_management_repo.dart';
import 'domain/usecase/get_gift_management_usecase.dart';
import 'presentation/bloc/gift_management_bloc.dart';

//todo add giftManagementFeatureDiConfig into global DI file
Future giftManagementFeatureDiConfig(GetIt injector) async {
  //<editor-fold desc="domain di">

  injector.registerFactory(
    () => GetGiftManagementUseCase(
      giftManagementRepo: injector(),
    ),
  );

  //</editor-fold>

  //<editor-fold desc="data di">

  injector.registerFactory(
    () => GiftManagementService(),
  );

  injector.registerFactory(
    () => GiftManagementMapper(),
  );

  injector.registerFactory<GiftManagementRepo>(
    () => GiftManagementRepoImpl(
      giftManagementMapper: injector(),
      giftManagementService: injector(),
    ),
  );

  //</editor-fold>

  //<editor-fold desc="presentation di">
  injector.registerFactory(
    () => GiftManagementBloc(
      getGiftManagementUseCase: injector(),
    ),
  );

  //</editor-fold>
}
