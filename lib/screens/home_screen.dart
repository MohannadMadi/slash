import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:slash/custom_widgets/horizontal_scroll_widget.dart';
import 'package:slash/model/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var watchProducts = context.watch<ListOfProducts>().products;
    return const CustomHorizontalProductScroll(
      label: "Products",
    );
  }
}
