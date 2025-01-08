import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/list_club_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ListClubController extends GetxController {
  final ListClubRepository _repository;

  ListClubController(this._repository);

  final Logger _logger = Logger();

  ListClubState listClubState = ListClubStateIdle();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getListClub();
  }

  void _getListClub() {
    listClubState = ListClubStateLoading();
    update();
    _repository.loadListClub(
        response: ResponseHandler(onSuccess: (listClub) {
      listClubState = ListClubStateSuccess(listClub);
    }, onFailed: (e, message) {
      _logger.e(message);
      listClubState = ListClubStateError();
    }, onDone: () {
      update();
    }));
  }
}
