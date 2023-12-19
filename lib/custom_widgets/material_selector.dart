import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomMaterialSelector extends StatefulWidget {
  final int productIndex;
  final Function onchanged;

  const CustomMaterialSelector(
      {super.key, required this.productIndex, required this.onchanged});

  @override
  State<CustomMaterialSelector> createState() => _CustomMaterialSelectorState();
}

int selectedIndex = 0;

class _CustomMaterialSelectorState extends State<CustomMaterialSelector> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var product =
        context.watch<ListOfProducts>().products![widget.productIndex];
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Material",
              style: TextStyle(fontSize: 20),
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
                    .uniqueMaterials!
                    .length,
                itemBuilder: (context, index) {
                  return product.verifyMaterial(index)
                      ? Container()
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              product.selectedMaterialIndex = index;
                              widget.onchanged();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                minWidth: 60,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: product.selectedMaterialIndex == index
                                      ? Colors.green[500]
                                      : Colors.grey[900]),
                              child: Text(
                                product.uniqueMaterials![index],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        );
                }),
          ),
        ),
      ],
    );
  }
}
