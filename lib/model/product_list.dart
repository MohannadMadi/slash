// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slash/model/product.dart';

class ListOfProducts extends ChangeNotifier {
  List<Product>? products;
  List<String>? uniqueColors;

  ListOfProducts({
    this.products,
    this.uniqueColors,
  });

  get getProducts => products;
  void addProduct(Product product) {
    products!.add(product);
    addUniqueColors(product);
    notifyListeners();
  }

// a list of unique colors to display in the product details screen
  void addUniqueColors(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      uniqueColors!.contains(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Color")
              .value)
          ? null
          : uniqueColors!.add(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Color")
              .value);
    }
  }
}
