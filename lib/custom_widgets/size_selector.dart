import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomSizeSelector extends StatefulWidget {
  final int productIndex;
  final Function onchanged;

  const CustomSizeSelector(
      {super.key, required this.productIndex, required this.onchanged});

  @override
  State<CustomSizeSelector> createState() => _CustomSizeSelectorState();
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
              child: const Text(
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
                      .uniqueSizes!
                      .length,
                  itemBuilder: (context, index) {
                    return
// if the intersection of the color id's and the size[index] id's > 0 it should work fine :)
                        context
                                .watch<ListOfProducts>()
                                .products![widget.productIndex]
                                .findIntersection(
                                    context
                                        .watch<ListOfProducts>()
                                        .products![widget.productIndex]
                                        .listOfSelectedColorIDs(context
                                                .watch<ListOfProducts>()
                                                .products![widget.productIndex]
                                                .uniqueColors![
                                            context
                                                .watch<ListOfProducts>()
                                                .products![widget.productIndex]
                                                .selectedColorIndex]),
                                    context
                                        .watch<ListOfProducts>()
                                        .products![widget.productIndex]
                                        .listOfSelectedSizeIDs(context
                                            .watch<ListOfProducts>()
                                            .products![widget.productIndex]
                                            .uniqueSizes![index]))
                                .isEmpty
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    context
                                        .read<ListOfProducts>()
                                        .products![widget.productIndex]
                                        .selectedSizeIndex = index;

                                    // this changes the index of the selcted material to the first material that exists for the selected size by getting the index of the first element that has an ID which intersects with an ID of the selected size
                                    context.read<ListOfProducts>().products![widget.productIndex].selectedMaterialIndex = context
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
                                                    context.read<ListOfProducts>().products![widget.productIndex].listOfSelectedSizeIDs(context.read<ListOfProducts>().products![widget.productIndex].uniqueSizes![context
                                                        .read<ListOfProducts>()
                                                        .products![
                                                            widget.productIndex]
                                                        .selectedSizeIndex]),
                                                    context.read<ListOfProducts>().products![widget.productIndex].findIntersection(
                                                        context
                                                            .read<ListOfProducts>()
                                                            .products![widget.productIndex]
                                                            .listOfSelectedSizeIDs(context.read<ListOfProducts>().products![widget.productIndex].uniqueSizes![context.read<ListOfProducts>().products![widget.productIndex].selectedSizeIndex]),
                                                        context.read<ListOfProducts>().products![widget.productIndex].listOfMaterialIDs()))
                                                .first]!);
                                  });
                                  widget.onchanged();
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
                                        color: context
                                                    .watch<ListOfProducts>()
                                                    .products![
                                                        widget.productIndex]
                                                    .selectedSizeIndex ==
                                                index
                                            ? Colors.green[500]
                                            : Colors.grey[900]),
                                    child: Text(
                                      context
                                          .watch<ListOfProducts>()
                                          .products![widget.productIndex]
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
