import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/list_club_item_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/list_club_item_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ListClubItemController extends GetxController {
  final ListClubItemRepository _repository;
  ListClubItemController(this._repository);

  final _logger = Logger();
  ListClubItemState state = ListClubItemStateIdle();
  final RxString idListClubItem = "".obs;

  @override
  void onInit() {
    super.onInit();
    idListClubItem.value = Get.arguments ?? "";
    _logger.i("Id List Club Item: ${idListClubItem.value}");
    if (idListClubItem.value.isNotEmpty) {
      _loadListClubItem();
    }
  }

  void _loadListClubItem() {
    state = ListClubItemStateLoading();
    update();
    if (idListClubItem.value.isNotEmpty) {
      _repository.loadListClubItem(
          response: ResponseHandler(onSuccess: (listClubItemModel) {
            state = ListClubItemStateSuccess(listClubItemModel);
          }, onFailed: (e, message) {
            state = ListClubItemStateError();
            _logger.e(e);
          }, onDone: () {
            update();
          }),
          id: idListClubItem.value);
    } else {
      state = ListClubItemStateError();
      update();
    }
  }
}
