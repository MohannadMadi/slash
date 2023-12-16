import 'package:flutter/material.dart';

class CustomProductWrapper extends StatefulWidget {
  final String imageUrl;
  final double size;
  const CustomProductWrapper(
      {super.key, required this.imageUrl, required this.size});

  @override
  State<CustomProductWrapper> createState() => _CustomProductWrapperState();
}

class _CustomProductWrapperState extends State<CustomProductWrapper> {
  @override
  Widget build(BuildContext context) {
    //!card
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.size / 8),
      ),
      child: widget.imageUrl.contains("http")
          ? Image(image: AssetImage(widget.imageUrl))
          : Image(image: AssetImage(widget.imageUrl)),
    );
  }
}
