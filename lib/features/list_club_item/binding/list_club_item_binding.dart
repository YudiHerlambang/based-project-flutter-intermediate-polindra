import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/list_club_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/list_club_item_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/repository/list_club_item_repository.dart';
import 'package:get/get.dart';

class ListClubItemBinding extends Bindings {
  @override
  void dependencies() {
    // Menyusun dependency injection untuk ListClubItem
    Get.lazyPut(() => ListClubItemDatasource(Network.dioClient()));
    Get.lazyPut(() => ListClubItemRepository(Get.find()));
    Get.lazyPut(() => ListClubItemController(Get.find()));
  }
}
