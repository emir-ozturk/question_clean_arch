import 'package:json_annotation/json_annotation.dart';
import 'package:question_clean_arch/features/question_answer/domain/entities/category_entity.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
