import 'dart:convert';

import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/list_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/list_club_datsource.dart';
import 'package:logger/logger.dart';

class ListClubRepository extends BaseRepository {
  final ListClubDataSource _datasource;
  ListClubRepository(this._datasource);
  final _logger = Logger();

  void loadListClub({required ResponseHandler<ListClubModel> response}) async {
    try {
      final String apiResponse = await _datasource.apiListClub();

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final ListClubModel listClub = ListClubModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(listClub);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
