import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_dio_data_source.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/ext/dio_ext.dart';

class ClubDatasource extends BaseDioDataSource {
  ClubDatasource(super._client);

  Future<String> apiClub() async {
    String path = 'search_all_teams.php';
    Map<String, dynamic> queryParameters = {'f': 'b'};

    return get<String>(path, queryParameters: queryParameters).load();
  }
}
