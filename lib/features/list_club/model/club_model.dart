import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/model/club_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_model.g.dart';

@JsonSerializable()
class ClubModel {
  final List<ClubItemModel>? teams;

  ClubModel(this.teams);

  factory ClubModel.fromJson(Map<String, dynamic> json) =>
      _$ClubModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClubModelToJson(this);
}
