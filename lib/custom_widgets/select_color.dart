import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/scroll_animation.dart';
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
bool ispressed = false;
//list to show colors only once

Color getColorFromHex(String hexColor) {
  final int hexValue = int.parse(hexColor.substring(2), radix: 16);
  return Color(hexValue | 0xFF000000);
}

class _CustomColorSelectorState extends State<CustomColorSelector> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex];
    var readProduct =
        context.read<ListOfProducts>().products![widget.productIndex];
    return SizedBox(
        width: screenWidth,
        height: 30,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: watchProduct.uniqueColors!.length,
            itemBuilder: (context, index) => !watchProduct.verifyColor(index)
                ? Container()
                : InkWell(
                    onTap: () {
                      watchProduct.selectedColorIndex == index
                          ? () {}
                          : setState(() {
                              context
                                  .read<CustomScrollAnimation>()
                                  .setAngleToZero();
                              readProduct.selectedColorIndex = index;
                              // this changes the index of the selcted size to the first size that exists for the selected color by getting the index of the first element that has an ID which intersects with an ID of the selected color

                              // this changes the index of the selcted material to the first material that exists for the selected color by getting the index of the first element that has an ID which intersects with an ID of the selected color

                              if (
                                  //if there is no size for the selected color
                                  watchProduct
                                          .findIntersection(
                                              watchProduct.listOfSelectedColorIDs(
                                                  watchProduct.uniqueColors![
                                                      watchProduct
                                                          .selectedColorIndex]),
                                              watchProduct.listOfSizeIDs())
                                          .isEmpty &&
                                      // and there is a material for the selected color
                                      watchProduct
                                          .findIntersection(
                                              watchProduct.listOfSelectedColorIDs(
                                                  watchProduct.uniqueColors![
                                                      watchProduct
                                                          .selectedColorIndex]),
                                              watchProduct.listOfMaterialIDs())
                                          .isNotEmpty) {
                                //the index of the material =
                                readProduct.selectedMaterialIndex = readProduct
                                    .uniqueMaterials!
                                    .indexOf(readProduct
                                            .variationIdOfUniqueMaterial![
                                        watchProduct
                                            .findIntersection(
                                                watchProduct.listOfSelectedColorIDs(
                                                    watchProduct.uniqueColors![
                                                        watchProduct
                                                            .selectedColorIndex]),
                                                watchProduct
                                                    .listOfMaterialIDs())
                                            .first]!);
                              } else {
                                //

                                readProduct.selectedSizeIndex =
                                    readProduct.uniqueSizes!.indexOf(readProduct
                                            .variationIdOfUniqueSize![
                                        readProduct
                                            .findIntersection(
                                                watchProduct.listOfSizeIDs(),
                                                watchProduct.listOfSelectedColorIDs(
                                                    watchProduct.uniqueColors![
                                                        watchProduct
                                                            .selectedColorIndex]))
                                            .first]!);
                              }
                            });

                      // print(watchProduct.verifyMaterial(1));
                      widget.onchanged();
                    },
                    child: Container(
                      width: 30,
                      decoration: watchProduct.selectedColorIndex == index
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 1.5, color: Colors.white))
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                  BoxShadow(color: Colors.white, blurRadius: 10)
                                ]),
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor:
                            getColorFromHex(watchProduct.uniqueColors![index]),
                      ),
                    ),
                  ),
          ),
        ));
  }
}
