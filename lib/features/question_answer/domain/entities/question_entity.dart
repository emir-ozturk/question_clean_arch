class QuestionEntity {
  final int id;
  final String question;
  final String answer;
  final List<String> categories;

  QuestionEntity({
    required this.id,
    required this.question,
    required this.answer,
    required this.categories,
  });
}
