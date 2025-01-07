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
      body: SafeArea(
        child: _bodyBuilder(), // Memanggil fungsi _bodyBuilder()
      ),
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

  // Menambahkan fungsi _listViewBuilder untuk membangun list view
  Widget _listViewBuilder(ListClubModel? listClubModel) {
    if (listClubModel == null || listClubModel.teams == null) {
      return const Center(child: Text("Empty"));
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
      itemCount: _controller.isShowMore.value
          ? listClubModel.teams?.length ??
              0 // Menampilkan semua item saat Show More
          : 3, // Menampilkan hanya 3 item saat Show Less
    );
  }

  // Fungsi _bodyBuilder untuk memanggil GetBuilder dan menampilkan state
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
          return _body(
              state.listClubModel); // Menggunakan _body untuk menampilkan data
        }

        return const Center(child: Text("Error"));
      },
    );
  }

  // Fungsi _body untuk menampilkan konten utama
  Widget _body(ListClubModel? listClubModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.25,
            child: _listViewBuilder(
                listClubModel), // Menampilkan list view sesuai data
          ),
          const SizedBox(height: 8),
          _buttonShowMore(), // Tombol untuk menampilkan lebih banyak
        ],
      ),
    );
  }

  // Fungsi button untuk menampilkan lebih banyak data
  Widget _buttonShowMore() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        return GestureDetector(
          onTap: () => _controller
              .isShowMoreData(), // Memanggil isShowMoreData() untuk membalikkan nilai
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              _controller.isShowMore.value ? "Show Less" : "Show More",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
