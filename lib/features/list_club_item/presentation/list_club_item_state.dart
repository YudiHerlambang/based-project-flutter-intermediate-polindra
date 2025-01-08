import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/item_club_model.dart';

abstract class ListClubItemState {}

class ListClubItemStateSuccess extends ListClubItemState {
  final ItemClubModel? itemClubModel;
  ListClubItemStateSuccess(this.itemClubModel);
}

class ListClubItemStateLoading extends ListClubItemState {}

class ListClubItemStateIdle extends ListClubItemState {}

class ListClubItemStateError extends ListClubItemState {}
