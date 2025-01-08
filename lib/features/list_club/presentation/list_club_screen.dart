import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_route.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/item_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/list_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListClubScreen extends StatefulWidget {
  const ListClubScreen({super.key});

  @override
  State<ListClubScreen> createState() => _ListClubScreenState();
}

class _ListClubScreenState extends State<ListClubScreen> {
  final _controller = Get.find<ListClubController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _bodyBuilder());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      centerTitle: true,
    );
  }

  Widget _listView(ListClubModel listClubModel) {
    return ListView.builder(
        itemCount: listClubModel.teams?.length ?? 0,
        itemBuilder: (context, index) {
          return _itemClub(listClubModel.teams![index]);
        });
  }

  Widget _itemClub(ItemClubModel item) {
    return GestureDetector(
      onTap: () async => Get.toNamed(AppRoute.detailClub, arguments: item),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: item.strBadge ?? AppConst.imageExample,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 80),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.strTeam ?? "-",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
              const SizedBox(
                width: 8.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<ListClubController>(builder: (controller) {
      final state = controller.listClubState;

      if (state is ListClubStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is ListClubStateError) {
        return const Center(
          child: Text("Error Bro"),
        );
      }

      if (state is ListClubStateSuccess) {
        return _listView(state.listClubModel!);
      }

      return Container();
    });
  }
}
