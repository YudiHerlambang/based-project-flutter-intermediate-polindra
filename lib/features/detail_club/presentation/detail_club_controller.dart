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
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    itemClubModel = Get.arguments;
    _isFavoriteClub();

    var data = await database.select(database.favoriteClubs).get();
    _logger.i(data.length);
  }

  void _isFavoriteClub() async {
    state = DetailClubStateLoading();
    update();

    try {
      final infoIsFavorite = database.select(database.favoriteClubs)
        ..where((test) => test.idTeam.equals(itemClubModel.idTeam!));
      final result = await infoIsFavorite.get(); // Ambil semua hasil

      if (result.isNotEmpty) {
        _logger.i("This club is your favorite item");
        isFavorite.value = true;

        // Log jika ada duplikasi
        if (result.length > 1) {
          _logger.w(
              "Duplicate favorite items detected for idTeam: ${itemClubModel.idTeam!}");
        }
      } else {
        _logger.i("This club is not your favorite item");
        isFavorite.value = false;
      }

      state = DetailClubStateSuccess(isFavorite.value);
    } catch (e) {
      state = DetailClubStateError();
      _logger.e(e);
    } finally {
      update();
    }
  }

  void actionOnTapButtonFavorite() {
    if (isFavorite.value) {
      (database.delete(database.favoriteClubs)
            ..where((tbl) => tbl.idTeam.equals(itemClubModel.idTeam!)))
          .go()
          .then((_) {
        isFavorite.value = false;
        _logger.i("Success delete as favorite");
      }).catchError((error) {
        _logger.e("Failed to delete favorite: $error");
      });
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
