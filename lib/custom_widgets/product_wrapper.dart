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
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Card(
        color: Colors.white,
        child: widget.imageUrl.contains("http")
            ? Image(fit: BoxFit.contain, image: NetworkImage(widget.imageUrl))
            : Image(
                fit: BoxFit.scaleDown,
                image: AssetImage(widget.imageUrl),
              ),
      ),
    );
  }
}
