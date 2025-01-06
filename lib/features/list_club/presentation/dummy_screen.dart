import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/widget/dummy_item_widget.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  final _controller = Get.find<DummyController>();

  @override
  void initState() {
    // TODO: implement initState
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

  Widget _listViewBuilder(DummyModel? listDummy) {
    if (listDummy == null) {
      return const Center(
        child: Text("Empty"),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: DummyItemWidget(
            dummyItemModel: listDummy.meals?[index],
          ),
        );
      },
      itemCount: listDummy.meals?.length ?? 0,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<DummyController>(
      builder: (controller) {
        final state = controller.dummyState;
        if (state is DummyStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DummyStateError) {
          return const Center(child: Text("Failed to load data"));
        }
        if (state is DummyStateSuccess) {
          return _listViewBuilder(state.listDummy);
        }

        return const Center(
          child: Text("Error"),
        );
      },
    );
  }
}
