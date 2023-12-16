// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/product.dart';
import 'package:slash/screens/product_details_screen.dart';

class CustomHorizontalScroll extends StatefulWidget {
  final String label;
  final List<Product> items;
  const CustomHorizontalScroll({
    super.key,
    required this.items,
    required this.label,
  });

  @override
  State<CustomHorizontalScroll> createState() => _CustomHorizontalScrollState();
}

class _CustomHorizontalScrollState extends State<CustomHorizontalScroll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 50),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: List.generate(
            widget.items.length,
            (index) => InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductScreen(product: widget.items[index])));
              },
              child: CustomProductWrapper(
                  imageUrl: widget.items
                      .elementAt(index)
                      .variations
                      .first
                      .productVarientImages[0],
                  size: 100),
            ),
          ),
        ),
      ],
    );
  }
}
