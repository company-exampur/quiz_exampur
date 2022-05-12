import 'package:http/http.dart' as http;
import 'package:quiztime/question_list_model.dart';
import 'dart:convert';
class ApiCallRepo {
  Future<QuestionListModel> getQuiz() async {
    final uri = Uri.parse('https://mock-api-repo.netlify.app/api/getQuiz.json');
    try {
      final response = await http.get(
          uri, headers: {
        'Content-Type': 'application/json',
      }
      );

      final list = QuestionListModel.fromJson(
          json.decode(response.body));
      return list;
    } on Exception catch (error) {
      print("Error is $error");
      throw Exception(


      );
    }
  }
}