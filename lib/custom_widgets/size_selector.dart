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
List<int> findIntersection<int>(List<int> list1, List<int> list2) {
  Set<int> set1 = Set<int>.from(list1);
  Set<int> set2 = Set<int>.from(list2);

  Set<int> intersection = set1.intersection(set2);

  return intersection.toList();
}

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
                  itemCount:
                      context.watch<ListOfProducts>().uniqueSizes!.length,
                  itemBuilder: (context, index) {
                    return
                        //condition to select the variation according to the id selected in the color_selector widget, and making sure the variation has a size
                        // context
                        //                 .watch<ListOfProducts>()
                        //                 .products![widget.productIndex]
                        //                 .variations![index]
                        //                 .id ==
                        //             context
                        //                 .watch<ListOfProducts>()
                        //                 .products![widget.productIndex]
                        //                 .currentVariationId &&
                        //         context
                        //             .watch<ListOfProducts>()
                        //             .products![widget.productIndex]
                        //             .variations![index]
                        //             .productPropertiesValues!
                        //             .any((element) => element.property == "Size")
//checking that the color and size are in the same variation
                        // context.watch<ListOfProducts>().uniqueColors![context
                        //             .read<ListOfProducts>()
                        //             .selectedColorIndex] ==

                        // context.watch<ListOfProducts>().uniqueSizes![index] ==

                        //                 //current selected color value
                        findIntersection(
                                    context
                                        .watch<ListOfProducts>()
                                        .listOfSelectedColorIDs(context
                                                .watch<ListOfProducts>()
                                                .uniqueColors![
                                            context
                                                .watch<ListOfProducts>()
                                                .selectedColorIndex]),
                                    context
                                        .watch<ListOfProducts>()
                                        .listOfSelectedSizeIDs(context
                                            .watch<ListOfProducts>()
                                            .uniqueSizes![index]))
                                .isEmpty
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    context
                                            .read<ListOfProducts>()
                                            .products![widget.productIndex]
                                            .currentVariationId =
                                        context
                                            .read<ListOfProducts>()
                                            .products![widget.productIndex]
                                            .variations![index]
                                            .id;
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
                                          .uniqueSizes![index],
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                  })),
        ),
      ],
    );
  }
}
