// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';
import 'package:slash/screens/home_screen.dart';

class Product extends ChangeNotifier {
  int? id;
  int? currentVariationId; // to toggle between variations
  String? name;
  String? description;
  int? brandId;
  String? brandName;
  String? brandLogoUrl;
  double? rating;
  List<ProductVariation>? variations;
  List<ProductPropertyAndValue>?
      availableProperties; //What properties are offered //(multiple colors or non, multiple sizes or non, materials)

  Product({
    this.id,
    this.currentVariationId,
    this.name,
    this.description,
    this.brandId,
    this.brandName,
    this.brandLogoUrl,
    this.rating,
    this.variations,
    this.availableProperties,
  });
}
