import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/dummy_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/dummy_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/dummy_repository.dart';
import 'package:get/get.dart';

class DummyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DummyDatasource(Network.dioClient()));
    Get.lazyPut(() => DummyRepository(Get.find()));
    Get.lazyPut(() => DummyController(Get.find()));
  }
}
