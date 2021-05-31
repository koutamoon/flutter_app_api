import 'package:json_annotation/json_annotation.dart';

part 'dream_world.g.dart';

@JsonSerializable()
class DreamWorld {
  DreamWorld(this.frontDefault, this.frontFemale);

  @JsonKey(name: 'front_default')
  String? frontDefault;

  @JsonKey(name: 'front_female')
  String? frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}
