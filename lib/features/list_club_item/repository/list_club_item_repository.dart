import 'dart:convert';

import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/model/list_club_item_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/list_club_item_datasource.dart';
import 'package:logger/logger.dart';

class ListClubItemRepository extends BaseRepository {
  final _logger = Logger();
  final ListClubItemDatasource _datasource;
  ListClubItemRepository(this._datasource);

  void loadListClubItem(
      {required ResponseHandler<ItemClubModel> response, String? id}) async {
    try {
      final String apiResponse = await _datasource.apiListClubItem(id);

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final ItemClubModel listClubData = ItemClubModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(listClubData);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
