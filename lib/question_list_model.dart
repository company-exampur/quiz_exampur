// To parse this JSON data, do
//
//     final bookModels = bookModelsFromJson(jsonString);

import 'dart:convert';

//QuestionListModel bookModelsFromJson(String str) => QuestionListModel.fromJson(json.decode(str));

//String bookModelsToJson(BookModels data) => json.encode(data.toJson());

class QuestionListModel {
  QuestionListModel({
    this.statusCode,
    this.data,
  });

  int? statusCode;
 Data? data;

  factory QuestionListModel.fromJson(Map<String, dynamic> json) => QuestionListModel(
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data!.toJson(),
  };
}

class Data {
Data({
    this.id,
    this.test_title,
    this.test_duration,
    this.tags,
    this.test_instruction,
    this.section,


  });

  String? id;
  String? test_title;
  int? test_duration;
 List<dynamic>?tags;
String? test_instruction;
  List<Section>? section;


  factory Data.fromJson(Map<String, dynamic> json) =>Data(
    id: json["_id"],
    section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
    test_title: json["test_title"],
    tags: json["tags"] as List<dynamic>,
    test_instruction: json["test_instruction"],
    test_duration: (json["test_duration"] ??0)as int,

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "section": List<dynamic>.from(section!.map((x) => x.toJson())),
    "test_title": test_title,
    "test_duration": test_duration,
    "test_instruction": test_instruction,
    "tags": tags,

  };
}

class Section {
  Section({
    this.section_name,
    this.section_instruction,
    this.section_subject,

    this.question,

  });

  String? section_name;


  String? section_subject;
  String? section_instruction;
  List<Question>? question;
  factory Section.fromJson(Map<String, dynamic> json) => Section(
    section_name: json["section_name"],
  question: List<Question>.from(json["question"].map((x) => Question.fromJson(x))),
    section_subject: json["section_subject"],
    section_instruction: json["section_instruction"] ,

  );

  Map<String, dynamic> toJson() => {
    "section_name":  section_name,
    "question": List<dynamic>.from(question!.map((x) => x.toJson())),
    "section_subject": section_subject,
    "section_instruction": section_instruction,

  };
}
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
class Options {
  Options({
    this.option_name,
    this.option_image,
    this.is_true
  });

  String? option_name;
  String? option_image;
  bool? is_true;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    option_name: json["option_name"],
    option_image: json["option_image"],
    is_true:json["is_true"]
  );

  Map<String, dynamic> toJson() => {
    "option_name": "option_name",
    "option_image": "option_image",
    "is_true":"is_true"
  };
}
class Solution {
  Solution({
    this.solution_name,
    this.solution_image,
  });

  String? solution_name;
  String? solution_image;

  factory Solution.fromJson(Map<String, dynamic> json) => Solution(
    solution_name: json["solution_name"],
    solution_image: json["solution_image"],
  );

  Map<String, dynamic> toJson() => {
    "solution_name": solution_name,
    "solution_image":solution_image,
  };
}
