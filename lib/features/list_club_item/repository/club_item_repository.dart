import 'dart:convert';

import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/club_item_datasource.dart';
import 'package:logger/logger.dart';

class ClubItemRepository extends BaseRepository {
  final _logger = Logger();
  final ClubItemDatasource _datasource;
  ClubItemRepository(this._datasource);

  void loadClubItem(
      {required ResponseHandler<ClubModel> response, String? id}) async {
    try {
      final String apiResponse = await _datasource.apiClubItem(id);

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final ClubModel clubData = ClubModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(clubData);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
