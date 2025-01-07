import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/model/item_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/list_club_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/list_club_item_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListClubItemScreen extends StatefulWidget {
  const ListClubItemScreen({super.key});

  @override
  State<ListClubItemScreen> createState() => _ListClubItemScreenState();
}

class _ListClubItemScreenState extends State<ListClubItemScreen> {
  final _controller = Get.find<ListClubItemController>();

  @override
  void initState() {
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuilder(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Detail Club Item",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<ListClubItemController>(builder: (controller) {
      final state = controller.state;
      if (state is ListClubItemStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ListClubItemStateError) {
        return const Center(
          child: Column(
            children: [
              Icon(Icons.error),
              SizedBox(
                height: 8,
              ),
              Text("ERROR")
            ],
          ),
        );
      }
      if (state is ListClubItemStateSuccess) {
        return _body(state.itemClubModel);
      }
      return Container();
    });
  }

  Widget _body(ItemClubModel? itemClubModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(24)),
            child: CachedNetworkImage(
              imageUrl: itemClubModel?.strBadge ?? AppConst.imageExample,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Klub
                Text(
                  itemClubModel?.strTeam ?? "Club Name",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Deskripsi Klub
                Text(
                  itemClubModel?.strDescriptionEN ?? "Club Description",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
