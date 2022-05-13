// To parse this JSON data, do
//
//     final bookModels = bookModelsFromJson(jsonString);

import 'dart:convert';

import 'package:quiztime/model/question_model.dart';

//QuestionListModel bookModelsFromJson(String str) => QuestionListModel.fromJson(json.decode(str));

//String bookModelsToJson(BookModels data) => json.encode(data.toJson());

class DataSectionModel {
  DataSectionModel({
    this.statusCode,
    this.data,
  });

  int? statusCode;
 Data? data;

  factory DataSectionModel.fromJson(Map<String, dynamic> json) => DataSectionModel(
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

