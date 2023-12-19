import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
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
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex];
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
          itemCount:
              watchProduct.getCurrentVariation().productVarientImages!.length,
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
                    imageUrl: watchProduct
                        .getCurrentVariation()
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
              itemCount: watchProduct
                  .getCurrentVariation()
                  .productVarientImages!
                  .length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          debugPrint(selectedIndex.toString());
                        });
                        buttonCarouselController.animateToPage(index,
                            duration: const Duration(milliseconds: 300));
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
                          child: watchProduct
                                  .getCurrentVariation()
                                  .productVarientImages![index]
                                  .contains("http")
                              ? Image(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(watchProduct
                                      .getCurrentVariation()
                                      .productVarientImages![index]))
                              : Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(watchProduct
                                      .getCurrentVariation()
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
