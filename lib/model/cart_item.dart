// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slash/model/product_variation.dart';

class CartItem extends ChangeNotifier {
  int? id;
  int? productVariationId;
  int quantity; //user can add one or multiple items of the same product variation at once
  List<ProductVariation>? cartItems;
  CartItem({
    this.id,
    this.productVariationId,
    this.quantity = 1,
    this.cartItems,
  });
  void addItemToCart(ProductVariation productVariation) {
    cartItems!.add(productVariation);
    productVariationId = productVariation.id;
  }
}
