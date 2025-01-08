import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/item_club_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_club_model.g.dart';

@JsonSerializable()
class ListClubModel {
  final List<ItemClubModel>? teams;

  ListClubModel(this.teams);

  factory ListClubModel.fromJson(Map<String, dynamic> json) =>
      _$ListClubModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListClubModelToJson(this);
}
