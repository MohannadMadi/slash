import 'package:flutter/material.dart';

import 'package:slash/custom_widgets/horizontal_scroll_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomHorizontalScroll(
      label: "Products",
    );
  }
}
