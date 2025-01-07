import 'package:json_annotation/json_annotation.dart';

part 'item_club_model.g.dart';

@JsonSerializable()
class ItemClubModel {
  final String? idTeam;
  final String? strTeam;
  final String? strDescriptionEN;
  final String? strBadge;

  ItemClubModel(
    this.idTeam,
    this.strTeam,
    this.strDescriptionEN,
    this.strBadge,
  );

  factory ItemClubModel.fromJson(Map<String, dynamic> json) =>
      _$ItemClubModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemClubModelToJson(this);
}
