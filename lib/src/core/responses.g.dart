// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Responses _$ResponsesFromJson(Map<String, dynamic> json) => Responses(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: json['data'],
  action: json['action'] as String?,
  statusCode: (json['statusCode'] as num).toInt(),
);

Map<String, dynamic> _$ResponsesToJson(Responses instance) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'action': instance.action,
};
