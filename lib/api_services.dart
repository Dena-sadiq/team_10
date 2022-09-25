

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:team_10/constant.dart';
import 'package:team_10/product_model.dart';


class ApiService {
  Future<List<Product>?> getProduct() async {
    try {
      var url = Uri.parse(APIS.baseUrl );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}














