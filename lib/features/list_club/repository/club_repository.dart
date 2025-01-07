import 'dart:convert';

import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/club_datasource.dart';
import 'package:logger/logger.dart';

class ClubRepository extends BaseRepository {
  final ClubDatasource _datasource;
  ClubRepository(this._datasource);
  final _logger = Logger();

  void loadClubs({required ResponseHandler<ClubModel> response}) async {
    try {
      final String apiResponse = await _datasource.apiClub();

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
