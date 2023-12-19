// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/cart_item.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/screens/product_details_screen.dart';

class CustomCartItemScroll extends StatefulWidget {
  final String label;
  const CustomCartItemScroll({
    super.key,
    required this.label,
  });

  @override
  State<CustomCartItemScroll> createState() => _CustomCartItemScrollState();
}

class _CustomCartItemScrollState extends State<CustomCartItemScroll> {
  @override
  Widget build(BuildContext context) {
    var watchCartItems = context.watch<CartItem>();
    var products = context.watch<ListOfProducts>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          Text(
            widget.label,
            style: const TextStyle(fontSize: 50),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: List.generate(
              watchCartItems.cartItems!.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductScreen(
                          productIndex: products.getProductIndexFromProductId(
                              watchCartItems.cartItems![index].productId!))));
                },
                child: CustomProductWrapper(
                    imageUrl: products
                        .products![products.getProductIndexFromProductId(
                            watchCartItems.cartItems![index].productId!)]
                        .variations![0]
                        .productVarientImages![0],
                    size: 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
