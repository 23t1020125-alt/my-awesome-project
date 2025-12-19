import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ApiService {
  final String _baseUrl = "https://saurav.tech/NewsAPI/top-headlines/category/technology/us.json";

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> articlesJson = jsonResponse['articles'];

        return articlesJson
            .map((json) => Article.fromJson(json))
            .where((article) => article.title != '[Removed]' && article.urlToImage.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to load news. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}