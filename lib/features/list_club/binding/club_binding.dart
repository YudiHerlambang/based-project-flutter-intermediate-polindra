import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/club_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/club_repository.dart';
import 'package:get/get.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubDatasource(Network.dioClient()));
    Get.lazyPut(() => ClubRepository(Get.find()));
    Get.lazyPut(() => ClubController(Get.find()));
  }
}
