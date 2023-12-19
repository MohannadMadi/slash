// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slash/model/product.dart';

class ListOfProducts extends ChangeNotifier {
  List<Product>? products;

  ListOfProducts({
    this.products,
  });

  get getProducts => products;
  void addProduct(Product product) {
    products == null ? products = [] : null;
    products!.add(product);
    product.addUniqueColors();
    product.addUniqueSize();
    product.addUniqueMaterial();
    product.addUniqeColorID();
    product.addUniqeSizeID();
    product.addUniqeMaterialID();
  }

  int getProductIndexFromProductId(int id) {
    return products!.isNotEmpty
        ? products!.indexOf(products!.firstWhere((element) => element.id == id))
        : -1;
  }
}
