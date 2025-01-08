// ignore_for_file: unused_import

import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/binding/detail_club_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/presentation/detail_club_screen.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/binding/dummy_item_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/presentation/dummy_item_screen.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/binding/dummy_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_screen.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/binding/list_club_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../main.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String detailClub = "/detailClub";
  static const String detailScreen = '/detailScreen';
  static const String notFound = '/notFound';

  static List<GetPage> pages = [
    GetPage(
        name: defaultRoute,
        page: () => const ListClubScreen(),
        binding: ListClubBinding()),
    GetPage(
        name: detailScreen,
        page: () => const DummyItemScreen(),
        binding: DummyItemBinding()),
    GetPage(
        name: detailClub,
        page: () => const DetailClubScreen(),
        binding: DetailClubBinding())
  ];
}
