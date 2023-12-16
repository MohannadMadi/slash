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
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Card(
        color: Colors.white,
        child: widget.imageUrl.contains("http")
            ? Image(image: NetworkImage(widget.imageUrl))
            : Image(
                image: AssetImage(widget.imageUrl),
              ),
      ),
    );
  }
}
