// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/add_to_cart.dart';
import 'package:slash/custom_widgets/description.dart';
import 'package:slash/custom_widgets/material_selector.dart';
import 'package:slash/custom_widgets/quantity_widget.dart';

import 'package:slash/custom_widgets/scroll_animation.dart';
import 'package:slash/custom_widgets/select_color.dart';
import 'package:slash/custom_widgets/size_selector.dart';
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
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex];
    return Scaffold(
      appBar: AppBar(title: const Text("Product details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(),
            CustomScrollAnimation(
              productIndex: widget.productIndex,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      watchProduct.name!,
                      style:
                          //making the fontsize change according to both screen height and width :)
                          TextStyle(
                              fontSize: screenWidth * screenHeight / 10000),
                    ),
                    Text(
                      "EGP ${watchProduct.getCurrentVariation().price}",
                      style: TextStyle(
                          fontSize: screenWidth * screenHeight / 10000),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage(watchProduct.brandLogoUrl!),
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
            !watchProduct.verifyColor(watchProduct.selectedColorIndex)
                ? Container()
                : CustomColorSelector(
                    productIndex: widget.productIndex,
                    onchanged: () {
                      setState(() {});
                    },
                  ),
            watchProduct.verifySize(watchProduct.selectedSizeIndex)
                ? Container()
                : CustomSizeSelector(
                    productIndex: widget.productIndex,
                    onchanged: () {
                      setState(() {});
                    },
                  ),
            watchProduct.verifyMaterial(watchProduct.selectedMaterialIndex)
                ? Container()
                : CustomMaterialSelector(
                    productIndex: widget.productIndex,
                    onchanged: () {
                      setState(() {});
                    }),
            CutomDescriptionDisply(
              productIndex: widget.productIndex,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomQuantityWidget(productIndex: widget.productIndex),
            const SizedBox(
              height: 30,
            ),
            CustomAddTocartButton(
              productIndex: widget.productIndex,
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
