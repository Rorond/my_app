import 'package:dio/dio.dart';
import 'package:my_app/models/articles/articles.dart';

class ArticleService {
  Future<List<Articles>> getData(page) async {
    var response = await Dio().get(
      "https://demo.treblle.com/api/v1/articles?page=$page",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    List<Articles> data = (obj["articles"] as List)
        .map((item) => Articles.fromJson(item))
        .toList();
    return data;
  }
}
