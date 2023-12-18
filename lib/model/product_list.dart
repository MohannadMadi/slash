// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slash/model/product.dart';

class ListOfProducts extends ChangeNotifier {
  List<Product>? products;
  List<String>? uniqueColors;
  Map<int, String>? variationIdOfUniqueColor;
  List<String>? uniqueSizes;
  List<String>? uniqueMaterials;
  late int selectedColorIndex;

  ListOfProducts({
    this.products,
    this.uniqueColors,
    this.variationIdOfUniqueColor,
    this.uniqueSizes,
    this.uniqueMaterials,
    this.selectedColorIndex = 0,
  });

  get getProducts => products;
  void addProduct(Product product) {
    products!.add(product);
    addUniqueColors(product);
    addUniqueSize(product);
    addUniqueMaterial(product);
    addUniqeColorID(product);
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

// a list of unique sizes to display in the product details screen

  void addUniqueSize(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      uniqueSizes!.contains(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Size")
              .value)
          ? null
          : uniqueSizes!.add(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Size")
              .value);
    }
  }
// a list of unique materials to display in the product details screen

  void addUniqueMaterial(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      uniqueMaterials!.contains(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Material")
              .value)
          ? null
          : uniqueMaterials!.add(product.variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Material")
              .value);
    }
  }

  void addUniqeColorID(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      product.variations![i].productPropertiesValues!
              .any((element) => element.property == "Color")
          ? variationIdOfUniqueColor![product.variations![i].id!] = product
              .variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Color")
              .value
          : null;
    }
  }
}
