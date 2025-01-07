import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/model/club_item_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/club_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/presentation/club_item_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubItemScreen extends StatefulWidget {
  const ClubItemScreen({super.key});

  @override
  State<ClubItemScreen> createState() => _ClubItemScreenState();
}

class _ClubItemScreenState extends State<ClubItemScreen> {
  final _controller = Get.find<ClubItemController>();

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
        "Detail Club Data",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<ClubItemController>(builder: (controller) {
      final state = controller.state;
      if (state is ClubItemStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ClubItemStateError) {
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
      if (state is ClubItemStateSuccess) {
        return _body(state.clubItemModel);
      }
      return Container();
    });
  }

  Widget _body(ClubItemModel? clubModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(24)),
            child: CachedNetworkImage(
              imageUrl: clubModel?.strTeamBadge ?? AppConst.imageExample,
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
                // Nama Tim
                Text(
                  clubModel?.strTeam ?? "Name Of Club",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Liga
                Text(
                  clubModel?.strLeague ?? "League",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  clubModel?.strDescriptionEN ?? "Description",
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
