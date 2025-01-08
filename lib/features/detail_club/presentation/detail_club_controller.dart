import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/sevices/database/database.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/presentation/detail_club_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/item_club_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DetailClubController extends GetxController {
  late ItemClubModel itemClubModel;

  DetailClubState state = DetailClubStateIdle();
  RxBool isFavorite = false.obs;
  AppDatabase database = AppDatabase();

  final Logger _logger = Logger();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemClubModel = Get.arguments;
    _isFavoriteClub();
  }

  void _isFavoriteClub() async {
    state = DetailClubStateLoading();
    update();

    try {
      final infoIsFavorite = database.select(database.favoriteClubs)
        ..where((test) => test.idTeam.equals(itemClubModel.idTeam!));
      final result = await infoIsFavorite.getSingleOrNull();

      if (result != null) {
        _logger.i("This club is your favorite item");
        isFavorite.value = true;
      } else {
        _logger.i("This club is not your favorite item");
        isFavorite.value = false;
      }

      state = DetailClubStateSuccess(isFavorite.value);
    } catch (e) {
      state = DetailClubStateError();
    } finally {
      update();
    }
  }

  void actionOnTapButtonFavorite() {
    if (isFavorite.value) {
      database
          .delete(database.favoriteClubs)
          .where((test) => test.idTeam.equals(itemClubModel.idTeam!));
      isFavorite.value = false;

      _logger.i("Success delete as favorite");
    } else {
      database.into(database.favoriteClubs).insert(
          FavoriteClubsCompanion.insert(
              idTeam: itemClubModel.idTeam ?? "",
              strTeam: itemClubModel.strTeam ?? "",
              strDescriptionEN: itemClubModel.strDescriptionEN ?? "",
              strBadge: itemClubModel.strBadge ?? AppConst.imageExample));

      isFavorite.value = true;

      _logger.i("Success set as favorite");
    }
  }
}
