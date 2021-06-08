import 'package:json_annotation/json_annotation.dart';

import 'dream_world.dart';
import 'official_artwork.dart';

part 'other.g.dart';

@JsonSerializable()
class Other {
  Other(this.dreamWorld, this.officialArtwork);

  @JsonKey(name: 'dream_world')
  DreamWorld? dreamWorld;

  @JsonKey(name: 'official-artwork')
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}
