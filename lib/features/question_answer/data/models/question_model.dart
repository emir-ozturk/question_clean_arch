import 'package:json_annotation/json_annotation.dart';
import 'package:question_clean_arch/features/question_answer/domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel extends QuestionEntity {
  QuestionModel({
    required super.id,
    required super.question,
    required super.answer,
    required super.categories,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
