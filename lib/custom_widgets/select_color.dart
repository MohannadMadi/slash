import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomColorSelector extends StatefulWidget {
  final int productIndex;
  const CustomColorSelector({super.key, required this.productIndex});

  @override
  State<CustomColorSelector> createState() => _CustomColorSelectorState();
}

int groupValue = 0;

class _CustomColorSelectorState extends State<CustomColorSelector> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: screenHeight / 10,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context
                .watch<ListOfProducts>()
                .products![widget.productIndex]
                .availableProperties!
                .length,
            itemBuilder: (context, index) => context
                        .watch<ListOfProducts>()
                        .products![widget.productIndex]
                        .availableProperties![index]
                        .property ==
                    "Color"
                ? Container(
                    width: 20,
                    height: 20,
                    child: Radio(
                      autofocus: true,
                      overlayColor: MaterialStatePropertyAll(
                        Color(context
                            .watch<ListOfProducts>()
                            .products![widget.productIndex]
                            .availableProperties![index]
                            .value
                            .hashCode),
                      ),
                      fillColor: MaterialStatePropertyAll(
                        Color(context
                            .watch<ListOfProducts>()
                            .products![widget.productIndex]
                            .availableProperties![index]
                            .value
                            .hashCode),
                      ),
                      value: index,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                  )
                : SizedBox()),
      ),
    );
  }
}
