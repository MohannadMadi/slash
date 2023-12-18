import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomSizeSelector extends StatefulWidget {
  final int productIndex;
  const CustomSizeSelector({super.key, required this.productIndex});

  @override
  State<CustomSizeSelector> createState() => _CustomSizeSelectorState();
}

int selectedIndex = 0;

class _CustomSizeSelectorState extends State<CustomSizeSelector> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Select Size",
              style: TextStyle(fontSize: 20),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Size Chart",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight / 20,
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: context
                    .watch<ListOfProducts>()
                    .products![widget.productIndex]
                    .variations!
                    .length,
                itemBuilder: (context, index) {
                  return
                      //condition to select the variation according to the id selected in the color_selector widget, and making sure the variation has a size
                      context
                                      .watch<ListOfProducts>()
                                      .products![widget.productIndex]
                                      .variations![index]
                                      .id ==
                                  context
                                      .watch<ListOfProducts>()
                                      .products![widget.productIndex]
                                      .currentVariationId &&
                              context
                                  .watch<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .variations![index]
                                  .productPropertiesValues!
                                  .any((element) => element.property == "Size")
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: const BoxConstraints(
                                    minWidth: 60,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: selectedIndex == index
                                          ? Colors.green[500]
                                          : Colors.grey[900]),
                                  child: Text(
                                    context
                                        .watch<ListOfProducts>()
                                        .products![widget.productIndex]
                                        .variations![index]
                                        .productPropertiesValues!
                                        .firstWhere((element) =>
                                            element.property == "Size")
                                        .value,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox();
                }),
          ),
        ),
      ],
    );
  }
}
