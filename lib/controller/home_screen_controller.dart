

import 'package:flutter/material.dart';
import 'package:flutter_application_api_4/model/product_details_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<ProductDetailsModel> myProducts = [];
  bool isLoading = false;
  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      myProducts = productDetailsModelFromJson(response.body);
    }
    isLoading = false;
    notifyListeners();
  }
}
