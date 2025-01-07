import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/widget/list_club_item_widget.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/list_club_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_state.dart';
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

  Widget _listViewBuilder(ListClubModel? listClubModel) {
    if (listClubModel == null || listClubModel.teams == null) {
      return const Center(
        child: Text("Empty"),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListClubItemWidget(
            listClubItemModel: listClubModel.teams?[index],
          ),
        );
      },
      itemCount: listClubModel.teams?.length ?? 0,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<ListClubController>(
      builder: (controller) {
        final state = controller.listClubState;
        if (state is ListClubStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ListClubStateError) {
          return const Center(child: Text("Failed to load data"));
        }

        if (state is ListClubStateSuccess) {
          return _listViewBuilder(state.listClubModel);
        }

        return const Center(
          child: Text("Error"),
        );
      },
    );
  }
}
