import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

class _CustomSizeSelectorState extends State<CustomSizeSelector>
    with ChangeNotifier {
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
// if the intersection of the color id's and the size[index] id's > 0 it should work fine :)
                        context
                                .watch<ListOfProducts>()
                                .findIntersection(
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
                                    context
                                        .read<ListOfProducts>()
                                        .selectedSizeIndex = index;

                                    // this changes the index of the selcted material to the first material that exists for the selected size by getting the index of the first element that has an ID which intersects with an ID of the selected size
                                    context.read<ListOfProducts>().selectedMaterialIndex = context
                                        .read<ListOfProducts>()
                                        .uniqueMaterials!
                                        .indexOf(context
                                                .read<ListOfProducts>()
                                                .variationIdOfUniqueMaterial![
                                            context
                                                .read<ListOfProducts>()
                                                .findIntersection(
                                                    context
                                                        .read<ListOfProducts>()
                                                        .listOfSelectedSizeIDs(context
                                                                .read<
                                                                    ListOfProducts>()
                                                                .uniqueSizes![
                                                            context
                                                                .read<
                                                                    ListOfProducts>()
                                                                .selectedSizeIndex]),
                                                    context
                                                        .read<ListOfProducts>()
                                                        .listOfMaterialIDs())
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
                                                    .selectedSizeIndex ==
                                                index
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
