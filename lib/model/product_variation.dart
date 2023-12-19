// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slash/model/product_property_and_value.dart';

class ProductVariation extends ChangeNotifier {
  final int? id;
  final int? productId;
  final num? price;
  final int? quantity;
  final bool? inStock; //to enable/disable addToCart button
  final List<String>? productVarientImages;
  final List<ProductPropertyAndValue>? productPropertiesValues;

  ProductVariation({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.inStock,
    this.productVarientImages,
    this.productPropertiesValues,
  });
}
