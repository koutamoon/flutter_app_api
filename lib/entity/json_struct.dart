import 'package:json_annotation/json_annotation.dart';

part 'json_struct.g.dart';

@JsonSerializable()
class JsonStruct {
  JsonStruct(this.ja, this.en);

  String ja;

  String en;
}
