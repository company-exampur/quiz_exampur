import 'options_sections_model.dart';

class Question {
  Question({
    this.id,
    this.question_name,
    this.question_subject,
    this.question_type,
    this.question_image,
    this.positive_mark,
    this.negative_mark,
    this.solution,
    this.options,
    this.tags,
    this.v,
    this.answer
  });

  String? id;
  String? question_name;
  String? question_subject;
  String? question_type;
  String? question_image;
  int? positive_mark;
  int? negative_mark;
  List<dynamic>? tags;
  List<Options>? options;
  List<Solution>? solution;
  String? answer;
  String? v;
  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],

    question_name:json["question_name"],
    question_subject:json["question_name"],
    question_type:json["question_type"],
    question_image:json["question_image"],
    positive_mark:json["positive_mark"] as int,
    negative_mark:json["negative_mark"] as int,

    tags:json["tags"] as List<dynamic>,
    answer:json["answer"],

    options: List<Options>.from(json["options"].map((x) => Options.fromJson(x))),
    solution: List<Solution>.from(json["solution"].map((x) => Solution.fromJson(x))),



  );

  Map<String, dynamic> toJson() => {
    "id": "id",

    "question_name":"question_name",
    "question_subject":"question_name",
    "question_type":"question_type",
    "question_image":"question_image",
    "positive_mark":"positive_mark",
    "negative_mark":"negative_mark",


    "answer":"answer",
    "solution": List<dynamic>.from(solution!.map((x) => x.toJson())),

    "options": List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}