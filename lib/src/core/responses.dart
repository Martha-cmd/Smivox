import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class Responses {
    bool success;
    final int statusCode;
    String? message;
    final dynamic data;
    String? action;

    Responses({
      required this.success,
      this.message,
      this.data,
      this.action,
      required this.statusCode,
    });


    factory Responses.fromJson(Map<String, dynamic> json) => _$ResponsesFromJson(json);

    Map<String, dynamic> toJson() => _$ResponsesToJson(this);
}