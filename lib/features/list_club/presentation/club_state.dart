import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/club_model.dart';

abstract class ClubState {}

class ClubStateSuccess extends ClubState {
  final ClubModel listClubs;
  ClubStateSuccess(this.listClubs);
}

class ClubStateLoading extends ClubState {}

class ClubStateIdle extends ClubState {}

class ClubStateError extends ClubState {}
