import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
Color getColorFromHex(String hexColor) {
  final int hexValue = int.parse(hexColor.substring(2), radix: 16);
  return Color(hexValue | 0xFF000000);
}

class _CustomColorSelectorState extends State<CustomColorSelector> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenWidth,
        height: 30,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<ListOfProducts>().uniqueColors!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  context.read<ListOfProducts>().selectedColorIndex = index;
                });
              },
              child: Container(
                width: 30,
                decoration:
                    context.watch<ListOfProducts>().selectedColorIndex == index
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
                  backgroundColor: getColorFromHex(
                      context.watch<ListOfProducts>().uniqueColors![index]),
                ),
              ),
            ),
          ),
        ));
  }
}
