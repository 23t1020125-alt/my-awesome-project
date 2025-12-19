import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiProduct {
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}