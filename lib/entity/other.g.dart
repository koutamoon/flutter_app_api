// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Other _$OtherFromJson(Map<String, dynamic> json) {
  return Other(
    json['dream_World'] == null
        ? null
        : DreamWorld.fromJson(json['dream_World'] as Map<String, dynamic>),
    json['official-artwork'] == null
        ? null
        : OfficialArtwork.fromJson(
            json['official-artwork'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'dream_World': instance.dreamWorld,
      'official-artwork': instance.officialArtwork,
    };
