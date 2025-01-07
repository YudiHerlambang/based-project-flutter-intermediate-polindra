// ignore_for_file: unused_import

import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/binding/list_club_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_screen.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/binding/list_club_item_binding.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/list_club_item_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../main.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String detailScreen = '/detailScreen';
  static const String notFound = '/notFound';

  static List<GetPage> pages = [
    GetPage(
        name: defaultRoute,
        page: () => const ListClubScreen(),
        binding: ListClubBinding()),
    GetPage(
        name: detailScreen,
        page: () => const ListClubItemScreen(),
        binding: ListClubItemBinding())
  ];
}
