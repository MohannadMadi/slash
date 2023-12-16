import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/product.dart';

class CustomScrollAnimation extends StatefulWidget {
  final Product product;
  const CustomScrollAnimation({super.key, required this.product});

  @override
  State<CustomScrollAnimation> createState() => _CustomScrollAnimationState();
}

class _CustomScrollAnimationState extends State<CustomScrollAnimation> {
  double pos = 10;
  void findWidgetPosition(GlobalKey widgetKey) {
    RenderBox renderBox =
        widgetKey.currentContext!.findRenderObject() as RenderBox;
    Offset widgetPosition = renderBox.localToGlobal(Offset(.5, .5));

    print('Widget Position: $widgetPosition');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            if (pos <= 0) {
              pos += details.delta.dx;
            }
            if (pos > 0) {
              pos = 0;
            }
            // pos = 0;
            print(pos);
          });
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: List.generate(
                  widget.product.variations
                      .elementAt(0)
                      .productVarientImages
                      .length,
                  (index) => AnimatedRotation(
                      //when pos =0 turns should be equal to 0
                      turns: 1,
                      //(pos / 10000) + index * .01,
                      duration: Duration(milliseconds: 20),
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 20),
                        offset: Offset(
                            // pos / 100 + index * 1.1
                            1,
                            .2),
                        child: InkWell(
                          onTap: () {
                            findWidgetPosition(
                                GlobalKey(debugLabel: "{$index}"));
                          },
                          child: CustomProductWrapper(
                              key: GlobalKey(debugLabel: "{$index}"),
                              imageUrl: widget.product.variations
                                  .elementAt(0)
                                  .productVarientImages[index],
                              size: screenHeight / 3),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
