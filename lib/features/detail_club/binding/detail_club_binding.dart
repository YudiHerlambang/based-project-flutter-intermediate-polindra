import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/presentation/detail_club_controller.dart';
import 'package:get/get.dart';

class DetailClubBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailClubController());
  }
}
