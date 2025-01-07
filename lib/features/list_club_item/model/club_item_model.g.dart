// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubItemModel _$ClubItemModelFromJson(Map<String, dynamic> json) =>
    ClubItemModel(
      idTeam: json['idTeam'] as String?,
      strTeam: json['strTeam'] as String?,
      strLeague: json['strLeague'] as String?,
      strLocation: json['strLocation'] as String?,
      strDescriptionEN: json['strDescriptionEN'] as String?,
      strTeamBadge: json['strTeamBadge'] as String?,
    );

Map<String, dynamic> _$ClubItemModelToJson(ClubItemModel instance) =>
    <String, dynamic>{
      'idTeam': instance.idTeam,
      'strTeam': instance.strTeam,
      'strLeague': instance.strLeague,
      'strLocation': instance.strLocation,
      'strDescriptionEN': instance.strDescriptionEN,
      'strTeamBadge': instance.strTeamBadge,
    };
