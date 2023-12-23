// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:slash/custom_widgets/material_selector.dart';
import 'package:slash/custom_widgets/product_wrapper.dart';
import 'package:slash/custom_widgets/select_color.dart';
import 'package:slash/model/carousel_procider.dart';
import 'package:slash/model/product_list.dart';

class CustomScrollAnimation extends StatefulWidget with ChangeNotifier {
  final int? productIndex;

  // ignore: use_super_parameters
  CustomScrollAnimation({
    Key? key,
    this.productIndex,
  }) : super(key: key);

  @override
  State<CustomScrollAnimation> createState() => _CustomScrollAnimationState();
}

class _CustomScrollAnimationState extends State<CustomScrollAnimation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double watchAngle = context.watch<CarouselProvider>().angle;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var watchProduct =
        context.watch<ListOfProducts>().products![widget.productIndex!];
    var readProduct =
        context.read<ListOfProducts>().products![widget.productIndex!];
    var buttonReader =
        context.read<CarouselProvider>().buttonCarouselController;

    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              onScrolled: (value) {
                setState(() {
                  context.read<CarouselProvider>().angle = value!;
                  print(watchAngle);
                });
              },
              onPageChanged: (index, reason) {
                setState(() {
                  selectedIndex = index;
                  print("---------------------${index}");
                });
              },
              height: screenHeight / 2,
              viewportFraction: .75,
              aspectRatio: 1 / 1,
              enableInfiniteScroll: false),
          carouselController: buttonReader,
          itemCount:
              watchProduct.getCurrentVariation().productVarientImages!.length,
          itemBuilder: (context, index, realIndex) => Column(
            children: [
              SizedBox(
                height: screenHeight / 10,
              ),
              AnimatedRotation(
                //equation for image rotaion
                turns: index * .06 - watchAngle * .06,
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
                        buttonReader!.animateToPage(index,
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
