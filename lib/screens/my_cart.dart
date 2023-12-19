import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/custom_Cart_item_scroll.dart';
import 'package:slash/model/cart_item.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    var watchMyCartItem = context.watch<CartItem>();

    return watchMyCartItem.cartItems!.isEmpty
        ? Container()
        : const CustomCartItemScroll(label: "My cart");
  }
}
