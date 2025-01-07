import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/club_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/club_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ClubController extends GetxController {
  final ClubRepository _repository;
  ClubState clubState = ClubStateIdle();
  final Logger _logger = Logger();
  ClubController(this._repository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadAllClubs();
  }

  void _loadAllClubs() {
    clubState = ClubStateLoading();
    update();
    _repository.loadClubs(
        response: ResponseHandler(onSuccess: (listClubs) {
      clubState = ClubStateSuccess(listClubs);
    }, onFailed: (e, message) {
      _logger.e(e);
      clubState = ClubStateError();
    }, onDone: () {
      update();
    }));
  }
}
