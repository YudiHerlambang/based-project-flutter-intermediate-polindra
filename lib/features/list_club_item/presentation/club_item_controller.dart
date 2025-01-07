import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/club_item_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/club_item_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ClubItemController extends GetxController {
  final ClubItemRepository _repository;
  ClubItemController(this._repository);

  final _logger = Logger();
  ClubItemState state = ClubItemStateIdle();
  final RxString idClubItem = "".obs;

  @override
  void onInit() {
    super.onInit();
    idClubItem.value = Get.arguments ?? "";
    _logger.i("Id Team : ${idClubItem.value}");
    if (idClubItem.value.isNotEmpty) {
      _loadClubItem();
    }
  }

  void _loadClubItem() {
    state = ClubItemStateLoading();
    update();
    if (idClubItem.value.isNotEmpty) {
      _repository.loadClubItem(
          response: ResponseHandler(onSuccess: (clubModel) {
            state = ClubItemStateSuccess(clubModel);
          }, onFailed: (e, message) {
            state = ClubItemStateError();
            _logger.e(e);
          }, onDone: () {
            update();
          }),
          id: idClubItem.value);
    } else {
      state = ClubItemStateError();
      update();
    }
  }
}
