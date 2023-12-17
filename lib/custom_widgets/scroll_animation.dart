import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';

class CustomScrollAnimation extends StatefulWidget {
  final int productIndex;
  const CustomScrollAnimation({super.key, required this.productIndex});

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
          itemCount: context
              .watch<ListOfProducts>()
              .products![widget.productIndex]
              .variations!
              .elementAt(0)
              .productVarientImages!
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
                    imageUrl: context
                        .watch<ListOfProducts>()
                        .products![widget.productIndex]
                        .variations!
                        .elementAt(0)
                        .productVarientImages![index],
                    size: screenWidth * .75),
              ),
            ],
          ),
        ),

        // image selector
        SizedBox(
          width: screenWidth,
          height: screenWidth / 8,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: context
                  .watch<ListOfProducts>()
                  .products![widget.productIndex]
                  .variations!
                  .elementAt(0)
                  .productVarientImages!
                  .length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
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
                          width: screenWidth / 8 - screenWidth / 90,
                          height: screenWidth / 8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(screenWidth / 100),
                              border: Border.all(
                                  width: 1.5,
                                  color: selectedIndex == index
                                      ? Colors.green.shade200
                                      : Colors.transparent)),
                          child: context
                                  .watch<ListOfProducts>()
                                  .products![widget.productIndex]
                                  .variations!
                                  .elementAt(0)
                                  .productVarientImages![index]
                                  .contains("http")
                              ? Image(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(context
                                      .watch<ListOfProducts>()
                                      .products![widget.productIndex]
                                      .variations!
                                      .elementAt(0)
                                      .productVarientImages![index]))
                              : Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(context
                                      .watch<ListOfProducts>()
                                      .products![widget.productIndex]
                                      .variations!
                                      .elementAt(0)
                                      .productVarientImages![index]),
                                )))),
            ),
          ),
        ),
        // Text(
        //   context.watch<Product>().id.toString(),
        //   style: TextStyle(color: Colors.white),
        // )
      ],
    );
  }
}
