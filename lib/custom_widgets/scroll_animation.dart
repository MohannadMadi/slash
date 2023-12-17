import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  double angle = 0;
  int selectedIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              onScrolled: (value) {
                setState(() {
                  angle = value!;
                });
              },
              onPageChanged: (index, reason) {
                setState(() {
                  selectedIndex = index;
                });
              },
              height: screenHeight / 2,
              viewportFraction: .75,
              aspectRatio: 1 / 1,
              enableInfiniteScroll: false),
          carouselController: buttonCarouselController,
          itemCount: widget.product.variations
              .elementAt(0)
              .productVarientImages
              .length,
          itemBuilder: (context, index, realIndex) => Column(
            children: [
              SizedBox(
                height: screenHeight / 10,
              ),
              AnimatedRotation(
                //equation for image rotaion
                turns: index * .06 - angle * .06,
                duration: Duration.zero,
                child: CustomProductWrapper(
                    imageUrl: widget.product.variations
                        .elementAt(0)
                        .productVarientImages[index],
                    size: screenWidth * .75),
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight / 15,
          child: Center(
            child: CarouselSlider.builder(
                itemCount: widget.product.variations
                    .elementAt(0)
                    .productVarientImages
                    .length,
                itemBuilder: (context, index, realIndex) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        print(selectedIndex);
                      });
                      buttonCarouselController.animateToPage(index,
                          duration: Duration(milliseconds: 300));
                    },
                    child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5,
                                color: selectedIndex == index
                                    ? Colors.green.shade200
                                    : Colors.transparent)),
                        child: widget.product.variations
                                .elementAt(0)
                                .productVarientImages[index]
                                .contains("http")
                            ? Image(
                                fit: BoxFit.contain,
                                image: NetworkImage(widget.product.variations
                                    .elementAt(0)
                                    .productVarientImages[index]))
                            : Image(
                                fit: BoxFit.scaleDown,
                                image: AssetImage(widget.product.variations
                                    .elementAt(0)
                                    .productVarientImages[index]),
                              ))),
                options: CarouselOptions(enableInfiniteScroll: false)),
          ),
        ),
        Container(
          color: Colors.amber,
          width: 10,
          height: 1000,
        )
      ],
    );
  }
}
