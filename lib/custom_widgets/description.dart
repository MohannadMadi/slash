import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product_list.dart';

class CutomDescriptionDisply extends StatefulWidget {
  final int productIndex;
  const CutomDescriptionDisply({super.key, required this.productIndex});

  @override
  State<CutomDescriptionDisply> createState() => _CutomDescriptionDisplyState();
}

class _CutomDescriptionDisplyState extends State<CutomDescriptionDisply> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: screenWidth - screenWidth / 20,
        child: ListTile(
            tileColor: Colors.grey[900],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              "Description",
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Text(context
                .watch<ListOfProducts>()
                .products![widget.productIndex]
                .description!)),
      ),
    );
  }
}
