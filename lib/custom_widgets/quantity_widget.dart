import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CustomQuantityWidget extends StatefulWidget {
  final int productIndex;
  const CustomQuantityWidget({super.key, required this.productIndex});

  @override
  State<CustomQuantityWidget> createState() => _CustomQuantityWidgetState();
}

int itemCounter = 1;

class _CustomQuantityWidgetState extends State<CustomQuantityWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth,
        height: 30,
        child: Row(
          children: [
            const Text(
              "Quantity",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCounter > 1 ? itemCounter-- : null;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(5), end: Radius.zero)),
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    "$itemCounter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCounter++;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            end: Radius.circular(5), start: Radius.zero)),
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
