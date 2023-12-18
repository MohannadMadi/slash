// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slash/model/product.dart';

class ListOfProducts extends ChangeNotifier {
  List<Product>? products;
  List<String>? uniqueColors;
  List<String>? uniqueSizes;
  List<String>? uniqueMaterials;
  Map<int, String>? variationIdOfUniqueColor;
  Map<int, String>? variationIdOfUniqueSize;
  Map<int, String>? variationIdOfUniqueMaterial;

  late int selectedColorIndex;

  ListOfProducts({
    this.products,
    this.uniqueColors,
    this.uniqueSizes,
    this.uniqueMaterials,
    this.variationIdOfUniqueColor,
    this.variationIdOfUniqueSize,
    this.variationIdOfUniqueMaterial,
    this.selectedColorIndex = 0,
  });

  get getProducts => products;
  void addProduct(Product product) {
    products!.add(product);
    addUniqueColors(product);
    addUniqueSize(product);
    addUniqueMaterial(product);
    addUniqeColorID(product);
    addUniqeSizeID(product);
    addUniqeMaterialID(product);
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

  void addUniqeSizeID(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      product.variations![i].productPropertiesValues!
              .any((element) => element.property == "Size")
          ? variationIdOfUniqueSize![product.variations![i].id!] = product
              .variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Size")
              .value
          : null;
    }
  }

  void addUniqeMaterialID(Product product) {
    for (var i = 0; i < product.variations!.length; i++) {
      product.variations![i].productPropertiesValues!
              .any((element) => element.property == "Material")
          ? variationIdOfUniqueMaterial![product.variations![i].id!] = product
              .variations![i].productPropertiesValues!
              .firstWhere((element) => element.property == "Material")
              .value
          : null;
    }
  }

  List listOfSelectedColorIDs(String selectedColor) {
    List<int> keys = [];
    variationIdOfUniqueColor!.forEach((key, value) {
      if (value == selectedColor) {
        keys.add(key);
      }
    });
    return keys;
  }

  List listOfSelectedSizeIDs(String selectedSize) {
    List<int> keys = [];
    variationIdOfUniqueSize!.forEach((key, value) {
      if (value == selectedSize) {
        keys.add(key);
      }
    });
    return keys;
  }

  List listOfSelectedMaterialIDs(String selectedMaterial) {
    List<int> keys = [];
    variationIdOfUniqueColor!.forEach((key, value) {
      if (value == selectedMaterial) {
        keys.add(key);
      }
    });
    return keys;
  }
}
