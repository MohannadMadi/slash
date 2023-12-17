import 'package:flutter/material.dart';
import 'package:slash/model/product_variation.dart';

class CustomProductDetailsDisplay extends StatelessWidget {
  final ProductVariation selectedVariation;
  const CustomProductDetailsDisplay(
      {super.key, required this.selectedVariation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Column()],
    );
  }
}
