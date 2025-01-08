import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/presentation/detail_club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/detail_club/presentation/detail_club_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailClubScreen extends StatefulWidget {
  const DetailClubScreen({super.key});

  @override
  State<DetailClubScreen> createState() => _DetailClubScreenState();
}

class _DetailClubScreenState extends State<DetailClubScreen> {
  final _controller = Get.find<DetailClubController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _bodyBuilder(),
        floatingActionButton: _floatingActionButton());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Detail Club",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(24)),
            child: CachedNetworkImage(
              imageUrl:
                  _controller.itemClubModel.strBadge ?? AppConst.imageExample,
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
                // Nama Makanan
                Text(
                  _controller.itemClubModel.strTeam ?? "Name Of Club",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Tipe Makanan
                Text(
                  _controller.itemClubModel.strStadium ?? "Name of Stadium",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  _controller.itemClubModel.strDescriptionEN ?? "Description",
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

  Widget _bodyBuilder() {
    return GetBuilder<DetailClubController>(builder: (controller) {
      final state = controller.state;

      if (state is DetailClubStateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is DetailClubStateError) {
        return const Center(
          child: Text("Error :("),
        );
      }

      if (state is DetailClubStateSuccess) {
        return _body();
      }

      return Container();
    });
  }

  Widget _floatingActionButton() {
    return GetBuilder<DetailClubController>(builder: (controller) {
      final state = controller.state;

      if (state is DetailClubStateLoading) {
        return Container();
      }

      if (state is DetailClubStateError) {
        return Container();
      }

      if (state is DetailClubStateSuccess) {
        return Obx(() {
          return FloatingActionButton(
            onPressed: () async => _controller.actionOnTapButtonFavorite(),
            backgroundColor:
                _controller.isFavorite.value ? Colors.red : Colors.black,
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          );
        });
      }

      return Container();
    });
  }
}
