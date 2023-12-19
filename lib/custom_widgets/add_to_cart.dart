import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/cart_item.dart';
import 'package:slash/model/product_list.dart';

class CustomAddTocartButton extends StatefulWidget {
  final int productIndex;
  const CustomAddTocartButton({super.key, required this.productIndex});

  @override
  State<CustomAddTocartButton> createState() => _CustomAddTocartButtonState();
}

class _CustomAddTocartButtonState extends State<CustomAddTocartButton> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex];
    var readProduct =
        context.read<ListOfProducts>().products![widget.productIndex];
    var watchCartItem = context.watch<CartItem>();
    var readCartItem = context.read<CartItem>();
    return Center(
      child: watchProduct.getCurrentVariation().inStock!
          ? InkWell(
              onTap: () {
                readCartItem.addItemToCart(readProduct.getCurrentVariation());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[500]),
                width: screenWidth - screenWidth / 20,
                height: screenHeight / 16,
                child: const Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            )
          : InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900]),
                width: screenWidth - screenWidth / 20,
                height: screenHeight / 16,
                child: const Text(
                  "Out of stock",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
    );
  }
}
