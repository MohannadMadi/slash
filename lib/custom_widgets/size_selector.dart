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
                    .availableProperties!
                    .length,
                itemBuilder: (context, index) => context
                            .watch<ListOfProducts>()
                            .products![widget.productIndex]
                            .availableProperties![index]
                            .property ==
                        "Size"
                    ? InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(
                            minWidth: 60,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.green[500]),
                          child: Text(
                            context
                                .watch<ListOfProducts>()
                                .products![widget.productIndex]
                                .availableProperties![index]
                                .value,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      )
                    : SizedBox()),
          ),
        ),
      ],
    );
  }
}
