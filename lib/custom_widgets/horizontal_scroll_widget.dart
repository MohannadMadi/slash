// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/screens/product_details_screen.dart';

class CustomHorizontalScroll extends StatefulWidget {
  final String label;
  const CustomHorizontalScroll({
    super.key,
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
            context.watch<ListOfProducts>().products!.length,
            (index) => InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductScreen(productIndex: index)));
              },
              child: CustomProductWrapper(
                  imageUrl: context
                      .watch<ListOfProducts>()
                      .products!
                      .elementAt(index)
                      .variations!
                      .first
                      .productVarientImages![0],
                  size: 100),
            ),
          ),
        ),
      ],
    );
  }
}
