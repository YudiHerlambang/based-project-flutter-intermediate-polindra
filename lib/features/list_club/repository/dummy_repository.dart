import 'dart:convert';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/repository/dummy_datasource.dart';
import 'package:logger/logger.dart';

class DummyRepository extends BaseRepository {
  final DummyDatasource _datasource;
  DummyRepository(this._datasource);
  final _logger = Logger();

  void loadDummy({required ResponseHandler<DummyModel> response}) async {
    try {
      final String apiResponse = await _datasource.apiDummy();

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final DummyModel dummyData = DummyModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(dummyData);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
