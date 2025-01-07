import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/list_club_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ListClubController extends GetxController {
  final ListClubRepository _repository;
  ListClubState listClubState = ListClubStateIdle();
  Logger _logger = Logger();

  // Show more or Show less
  RxBool isShowMore = false.obs;

  ListClubController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getListClub();
  }

  void _getListClub() {
    listClubState = ListClubStateLoading();
    update(); // Update the UI
    _repository.loadListClub(
      response: ResponseHandler(
        onSuccess: (listClub) {
          listClubState = ListClubStateSuccess(listClub);
        },
        onFailed: (e, message) {
          _logger.e(message);
          listClubState = ListClubStateError();
        },
        onDone: () {
          update(); // Update the UI
        },
      ),
    );
  }

  // Fungsi untuk mengubah status Show More atau Show Less
  void isShowMoreData() {
    isShowMore.value = !isShowMore.value;
    update(); // Memastikan tampilan di-refresh setelah nilai berubah
  }
}
