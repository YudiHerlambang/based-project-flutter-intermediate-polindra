import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/club_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/club_item_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/club_item_repository.dart';
import 'package:get/get.dart';

class ClubItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubItemDatasource(Network.dioClient()));
    Get.lazyPut(() => ClubItemRepository(Get.find()));
    Get.lazyPut(() => ClubItemController(Get.find()));
  }
}
