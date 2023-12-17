import 'package:flutter/material.dart';
import 'package:slash/model/product.dart';

class ListOfProducts extends ChangeNotifier {
  List<Product>? products;

  ListOfProducts({this.products});

  get getProducts => products;
  void addProduct(Product product) {
    products!.add(product);
    notifyListeners();
  }
}
