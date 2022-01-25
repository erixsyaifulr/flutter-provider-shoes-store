import 'dart:convert';

import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'http://192.168.43.125:8000/api';

  Future<List<ProductModel>> getProduct() async {
    var url = '$baseUrl/products';
    var header = {'Content-type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
