// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/screens/product_details_screen.dart';

class CustomHorizontalProductScroll extends StatefulWidget {
  final String label;

  const CustomHorizontalProductScroll({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomHorizontalProductScroll> createState() =>
      _CustomHorizontalScrollState();
}

class _CustomHorizontalScrollState
    extends State<CustomHorizontalProductScroll> {
  @override
  Widget build(BuildContext context) {
    var watchProducts = context.watch<ListOfProducts>().products!;
    return Column(
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 50),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: List.generate(
            watchProducts.length,
            (index) => InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductScreen(productIndex: index)));
              },
              child: CustomProductWrapper(
                  imageUrl: watchProducts[index]
                      .variations![0]
                      .productVarientImages![0],
                  size: 100),
            ),
          ),
        ),
      ],
    );
  }
}
