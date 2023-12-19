import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomColorSelector extends StatefulWidget {
  final int productIndex;
  final Function onchanged;
  const CustomColorSelector(
      {super.key, required this.productIndex, required this.onchanged});

  @override
  State<CustomColorSelector> createState() => _CustomColorSelectorState();
}

int groupValue = 0;

//list to show colors only once

Color getColorFromHex(String hexColor) {
  final int hexValue = int.parse(hexColor.substring(2), radix: 16);
  return Color(hexValue | 0xFF000000);
}

class _CustomColorSelectorState extends State<CustomColorSelector> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth,
        height: 30,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context
                .watch<ListOfProducts>()
                .products![widget.productIndex]
                .uniqueColors!
                .length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  context
                      .read<ListOfProducts>()
                      .products![widget.productIndex]
                      .selectedColorIndex = index;
                  // this changes the index of the selcted size to the first size that exists for the selected color by getting the index of the first element that has an ID which intersects with an ID of the selected color

                  context
                          .read<ListOfProducts>()
                          .products![widget.productIndex]
                          .selectedSizeIndex =
                      context
                          .read<ListOfProducts>()
                          .products![widget.productIndex]
                          .uniqueSizes!
                          .indexOf(context
                                  .read<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .variationIdOfUniqueSize![
                              context
                                  .read<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .findIntersection(
                                      context
                                          .read<ListOfProducts>()
                                          .products![widget.productIndex]
                                          .listOfSelectedColorIDs(
                                              context
                                                      .read<ListOfProducts>()
                                                      .products![
                                                          widget.productIndex]
                                                      .uniqueColors![
                                                  context
                                                      .read<ListOfProducts>()
                                                      .products![
                                                          widget.productIndex]
                                                      .selectedColorIndex]),
                                      context
                                          .read<ListOfProducts>()
                                          .products![widget.productIndex]
                                          .listOfSizeIDs())
                                  .first]!);
                  // this changes the index of the selcted material to the first material that exists for the selected size by getting the index of the first element that has an ID which intersects with an ID of the selected size

                  context
                          .read<ListOfProducts>()
                          .products![widget.productIndex]
                          .selectedMaterialIndex =
                      context
                          .read<ListOfProducts>()
                          .products![widget.productIndex]
                          .uniqueMaterials!
                          .indexOf(context
                                  .read<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .variationIdOfUniqueMaterial![
                              context
                                  .read<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .findIntersection(
                                      context
                                          .read<ListOfProducts>()
                                          .products![widget.productIndex]
                                          .listOfSelectedSizeIDs(
                                              context
                                                      .read<ListOfProducts>()
                                                      .products![
                                                          widget.productIndex]
                                                      .uniqueSizes![
                                                  context
                                                      .read<ListOfProducts>()
                                                      .products![
                                                          widget.productIndex]
                                                      .selectedSizeIndex]),
                                      context
                                          .read<ListOfProducts>()
                                          .products![widget.productIndex]
                                          .listOfMaterialIDs())
                                  .first]!);
                });
                widget.onchanged();
              },
              child: Container(
                width: 30,
                decoration: context
                            .watch<ListOfProducts>()
                            .products![widget.productIndex]
                            .selectedColorIndex ==
                        index
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1.5, color: Colors.white))
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                            BoxShadow(color: Colors.white, blurRadius: 10)
                          ]),
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: getColorFromHex(context
                      .watch<ListOfProducts>()
                      .products![widget.productIndex]
                      .uniqueColors![index]),
                ),
              ),
            ),
          ),
        ));
  }
}
