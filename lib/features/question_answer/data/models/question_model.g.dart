// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) => QuestionModel(
  id: (json['id'] as num).toInt(),
  question: json['soru'] as String,
  answer: json['cevap'] as String,
  categories: (json['kategoriler'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) => <String, dynamic>{
  'id': instance.id,
  'soru': instance.question,
  'cevap': instance.answer,
  'kategoriler': instance.categories,
};
