import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

    return Center(
      child: context
              .watch<ListOfProducts>()
              .products![widget.productIndex]
              .variations![0]
              .inStock!
          ? InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[500]),
                width: screenWidth - screenWidth / 20,
                height: screenHeight / 16,
                child: Text(
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
                child: Text(
                  "Out of stock",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
    );
  }
}
