import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/club_model.dart';

abstract class ClubItemState {}

class ClubItemStateSuccess extends ClubItemState {
  final ClubModel? clubItemModel;
  ClubItemStateSuccess(this.clubItemModel);
}

class ClubItemStateLoading extends ClubItemState {}

class ClubItemStateIdle extends ClubItemState {}

class ClubItemStateError extends ClubItemState {}
