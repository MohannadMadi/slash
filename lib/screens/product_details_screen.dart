// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/add_to_cart.dart';
import 'package:slash/custom_widgets/description.dart';
import 'package:slash/custom_widgets/material_selector.dart';
import 'package:slash/custom_widgets/quantity_widget.dart';

import 'package:slash/custom_widgets/scroll_animation.dart';
import 'package:slash/custom_widgets/select_color.dart';
import 'package:slash/custom_widgets/size_selector.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';

class ProductScreen extends StatefulWidget {
  final int productIndex;
  const ProductScreen({
    super.key,
    required this.productIndex,
  });

  @override
  State<ProductScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Product details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(),
            // CustomProductWrapper(product: widget.product, size: 300)
            CustomScrollAnimation(productIndex: widget.productIndex),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context
                          .watch<ListOfProducts>()
                          .products![widget.productIndex]
                          .name!,
                      style:
                          //making the fontsize change according to both screen height and width :)
                          TextStyle(
                              fontSize: screenWidth * screenHeight / 10000),
                    ),
                    Text(
                      "EGP ${context.watch<ListOfProducts>().products![widget.productIndex].variations![0].price}",
                      style: TextStyle(
                          fontSize: screenWidth * screenHeight / 10000),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage(context
                          .watch<ListOfProducts>()
                          .products![widget.productIndex]
                          .brandLogoUrl!),
                    ),
                    Text(
                      "${context.watch<ListOfProducts>().products![widget.productIndex].brandName}",
                      style: TextStyle(
                          fontSize: screenWidth * screenHeight / 15000),
                    )
                  ],
                )
              ],
            ),
            CustomColorSelector(productIndex: widget.productIndex),
            CustomSizeSelector(productIndex: widget.productIndex),
            CustomMaterialSelector(productIndex: widget.productIndex),
            CutomDescriptionDisply(
              productIndex: widget.productIndex,
            ),
            CustomQuantityWidget(productIndex: widget.productIndex),
            CustomAddTocartButton(
              productIndex: widget.productIndex,
            ),
            FloatingActionButton(onPressed: () {
              print(context.read<ListOfProducts>().uniqueColors!.length);
            })
          ],
        ),
      ),
    );
  }
}
