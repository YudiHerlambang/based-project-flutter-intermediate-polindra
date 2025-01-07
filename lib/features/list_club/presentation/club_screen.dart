import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/widget/club_item_widget.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/club_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({super.key});

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  final _controller = Get.find<ClubController>();

  @override
  void initState() {
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(child: _bodyBuilder()),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _listViewBuilder(ClubModel? listClub) {
    if (listClub == null || listClub.teams == null || listClub.teams!.isEmpty) {
      return const Center(
        child: Text("No clubs available"),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ClubItemWidget(
            clubItemModel: listClub.teams?[index],
          ),
        );
      },
      itemCount: listClub.teams?.length ?? 0,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<ClubController>(
      builder: (controller) {
        final state = controller.clubState;
        if (state is ClubStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ClubStateError) {
          return const Center(child: Text("Failed to load data"));
        }

        if (state is ClubStateSuccess) {
          return _listViewBuilder(state.listClubs);
        }

        return const Center(
          child: Text("Unexpected error occurred"),
        );
      },
    );
  }
}
