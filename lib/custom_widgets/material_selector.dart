import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomMaterialSelector extends StatefulWidget {
  final int productIndex;
  const CustomMaterialSelector({super.key, required this.productIndex});

  @override
  State<CustomMaterialSelector> createState() => _CustomMaterialSelectorState();
}

int selectedIndex = 0;

class _CustomMaterialSelectorState extends State<CustomMaterialSelector> {
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
                    .availableProperties!
                    .length,
                itemBuilder: (context, index) {
                  return context
                              .watch<ListOfProducts>()
                              .products![widget.productIndex]
                              .availableProperties![index]
                              .property ==
                          "Material"
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
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
                                  color: selectedIndex == index
                                      ? Colors.green[500]
                                      : Colors.grey[900]),
                              child: Text(
                                context
                                    .watch<ListOfProducts>()
                                    .products![widget.productIndex]
                                    .availableProperties![index]
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
