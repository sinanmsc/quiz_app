import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/questions/question_model.dart';

class ApiService {
  static Dio dio =
      Dio(BaseOptions(baseUrl: 'https://nice-lime-hippo-wear.cyclic.app'));
  static Future<List<Questions>?> getData() async {
    try {
      Response response = await dio.get('/api/v1/quiz');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final questions = <Questions>[];
        for (final i in response.data) {
          questions.add(Questions.fromJson(i));
        }
        return questions;
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }
}

final getDataProvider = FutureProvider<List<Questions>?>((ref) async {
  return ApiService.getData();
});
