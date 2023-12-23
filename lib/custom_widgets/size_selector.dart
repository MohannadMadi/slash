import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/scroll_animation.dart';
import 'package:slash/custom_widgets/select_color.dart';
import 'package:slash/model/carousel_procider.dart';
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
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex];
    var readProduct =
        context.read<ListOfProducts>().products![widget.productIndex];
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
                  itemCount: watchProduct.uniqueSizes!.length,
                  itemBuilder: (context, index) {
                    return
// if the intersection of the color id's and the size[index] id's > 0 it should work fine :)
                        watchProduct.verifySize(index)
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  watchProduct.selectedSizeIndex == index
                                      ? () {}
                                      : setState(() {
                                          context
                                              .read<CarouselProvider>()
                                              .setAngleToZero();

                                          readProduct.selectedSizeIndex = index;

                                          // this changes the index of the selcted material to the first material that exists for the selected size by getting the index of the first element that has an ID which intersects with an ID of the selected size
                                          if (readProduct
                                              .findIntersection(
                                                  readProduct.listOfSelectedSizeIDs(
                                                      readProduct.uniqueSizes![
                                                          readProduct
                                                              .selectedSizeIndex]),
                                                  readProduct
                                                      .listOfMaterialIDs())
                                              .isNotEmpty) {
                                            readProduct.selectedMaterialIndex = readProduct
                                                .uniqueMaterials!
                                                .indexOf(readProduct
                                                        .variationIdOfUniqueMaterial![
                                                    readProduct
                                                        .findIntersection(
                                                            readProduct.listOfSelectedSizeIDs(
                                                                readProduct
                                                                        .uniqueSizes![
                                                                    readProduct
                                                                        .selectedSizeIndex]),
                                                            readProduct
                                                                .listOfMaterialIDs())
                                                        .first]!);
                                          }
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
                                        color: watchProduct.selectedSizeIndex ==
                                                index
                                            ? Colors.green[500]
                                            : Colors.grey[900]),
                                    child: Text(
                                      watchProduct.uniqueSizes![index],
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
