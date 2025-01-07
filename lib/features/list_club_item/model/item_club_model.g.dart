// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_club_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemClubModel _$ItemClubModelFromJson(Map<String, dynamic> json) =>
    ItemClubModel(
      json['idTeam'] as String?,
      json['strTeam'] as String?,
      json['strDescriptionEN'] as String?,
      json['strBadge'] as String?,
    );

Map<String, dynamic> _$ItemClubModelToJson(ItemClubModel instance) =>
    <String, dynamic>{
      'idTeam': instance.idTeam,
      'strTeam': instance.strTeam,
      'strDescriptionEN': instance.strDescriptionEN,
      'strBadge': instance.strBadge,
    };
