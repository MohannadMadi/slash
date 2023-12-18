import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomColorSelector extends StatefulWidget {
  final int productIndex;
  const CustomColorSelector({super.key, required this.productIndex});

  @override
  State<CustomColorSelector> createState() => _CustomColorSelectorState();
}

int groupValue = 0;

//list to show colors only once
List<String> colorsInSellerApp = [
  "0xffff0000",
  "0xffff0000",
  "0x0fffffff",
  "0xff0000ff"
];

class _CustomColorSelectorState extends State<CustomColorSelector> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: screenHeight / 10,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<ListOfProducts>().uniqueColors!.length,
            itemBuilder: (context, index) =>
                //
                context.watch<ListOfProducts>().uniqueColors != null
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: Radio(
                          autofocus: true,
                          overlayColor: MaterialStatePropertyAll(
                            Color(Color(colorsInSellerApp[index].hashCode)
                                .hashCode),
                          ),
                          fillColor: MaterialStatePropertyAll(Color(context
                              .watch<ListOfProducts>()
                              .uniqueColors![index]
                              .hashCode)),
                          value: index,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                              // context
                              //         .read<ListOfProducts>()
                              //         .products![widget.productIndex]
                              //         .currentVariationId =
                              //     context
                              //         .read<ListOfProducts>()
                              //         .products![widget.productIndex]
                              //         .variations![index]
                              //         .id;
                            });
                            print(
                                context.watch<ListOfProducts>().uniqueColors!);
                          },
                        ),
                      )
                    : SizedBox()),
      ),
    );
  }
}
