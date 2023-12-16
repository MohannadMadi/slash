// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/custom_widgets/scroll_animation.dart';

import 'package:slash/model/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product details")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          // CustomProductWrapper(product: widget.product, size: 300)
          CustomScrollAnimation(product: widget.product)
        ],
      ),
    );
  }
}
