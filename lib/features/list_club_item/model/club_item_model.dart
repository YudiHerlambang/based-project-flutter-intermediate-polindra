import 'package:json_annotation/json_annotation.dart';

part 'club_item_model.g.dart';

@JsonSerializable()
class ClubItemModel {
  final String? idTeam;
  final String? strTeam;
  final String? strLeague;
  final String? strLocation;
  final String? strDescriptionEN;
  final String? strTeamBadge; // Atribut logo tim

  ClubItemModel({
    this.idTeam,
    this.strTeam,
    this.strLeague,
    this.strLocation,
    this.strDescriptionEN,
    this.strTeamBadge, // Inisialisasi logo tim
  });

  factory ClubItemModel.fromJson(Map<String, dynamic> json) =>
      _$ClubItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClubItemModelToJson(this);
}
