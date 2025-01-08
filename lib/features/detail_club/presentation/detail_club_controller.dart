import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/item_club_model.dart';
import 'package:get/get.dart';

class DetailClubController extends GetxController {
  late ItemClubModel itemClubModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemClubModel = Get.arguments;
  }
}
