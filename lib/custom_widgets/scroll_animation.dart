import 'package:carousel_slider/carousel_slider.dart';
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
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    CarouselController buttonCarouselController = CarouselController();
    return SizedBox(
      child: CarouselSlider.builder(
          carouselController: buttonCarouselController,
          itemCount: widget.product.variations
              .elementAt(0)
              .productVarientImages
              .length,
          itemBuilder: (context, index, realIndex) => Stack(
                children: [
                  AnimatedRotation(
                    //equation for image rotaion
                    turns: index * .07 - angle * .07,
                    duration: Duration.zero,
                    child: CustomProductWrapper(
                        imageUrl: widget.product.variations
                            .elementAt(0)
                            .productVarientImages[index],
                        size: screenWidth * .8),
                  ),
                ],
              ),
          options: CarouselOptions(
              onScrolled: (value) {
                print(angle);
                setState(() {
                  angle = value!;
                });
              },
              aspectRatio: 1 / 1,
              enableInfiniteScroll: false)),
    );
    // Offset findWidgetPosition(GlobalKey widgetKey) {
    //   RenderBox renderBox =
    //       widgetKey.currentContext!.findRenderObject() as RenderBox;
    //   Offset widgetPosition = renderBox.localToGlobal(Offset.zero);

    //   return widgetPosition;
    // }

    // GlobalKey widgetKey = GlobalKey(debugLabel: "0");

    // return Row(
    //   children: [
    //     Swiper(
    //       itemHeight: 200,
    //       itemWidth: 222,
    //       itemCount: 2,
    //       pagination: const SwiperPagination(),
    //       control: const SwiperControl(),
    //       itemBuilder: (context, index) => SizedBox(
    //         width: screenWidth,
    //         height: screenHeight / 3,
    //         child: CustomProductWrapper(
    //             imageUrl: widget.product.variations
    //                 .elementAt(0)
    //                 .productVarientImages[index],
    //             size: 300),
    //       ),
    //     ),
    //   ],
    // );
    // return Column(
    //   children: [
    //     SizedBox(
    //       width: screenWidth,
    //       height: screenHeight / 3,
    //       child: NotificationListener<ScrollNotification>(
    //         onNotification: (notification) {
    //           if (notification is ScrollUpdateNotification) {
    //             pos += notification.scrollDelta!;

    //             print(pos);
    //           }
    //           return true;
    //         },
    //         child: PageView.custom(onPageChanged: (value) {
    //           // setState(() {
    //           //   pos = value;
    //           // });
    //         }, childrenDelegate: SliverChildBuilderDelegate((context, index) {
    //           return Positioned(
    //             left: index * .2,
    //             child: Stack(
    //               // key: widgetKey,
    //               children: [
    //                 AnimatedRotation(
    //                   duration: Duration(seconds: 0),
    //                   turns: pos,
    //                   child: CustomProductWrapper(
    //                       imageUrl: widget.product.variations
    //                           .elementAt(0)
    //                           .productVarientImages[index],
    //                       size: 300),
    //                 ),
    //               ],
    //             ),
    //           );
    //         })),
    //       ),
    //     )
    //   ],
    // );
    // return Center(
    //   child: SizedBox(
    //     width: screenWidth,
    //     height: screenHeight / 3,
    //     child: CustomScrollView(
    //       scrollDirection: Axis.horizontal,
    //       slivers: [
    //         SliverList(
    //             delegate: SliverChildBuilderDelegate(
    //           childCount: widget.product.variations
    //               .elementAt(0)
    //               .productVarientImages
    //               .length,
    //           (context, index) => CustomProductWrapper(
    //               imageUrl: widget.product.variations
    //                   .elementAt(0)
    //                   .productVarientImages[index],
    //               size: 300),
    //         ))
    //       ],
    //     ),
    //   ),
    // );
    // return Center(
    //   child: Container(
    //     height: screenHeight / 3,
    //     width: screenWidth,
    //     child: Stack(
    //       children: [
    //         PageView.builder(
    //           itemCount: widget.product.variations
    //               .elementAt(0)
    //               .productVarientImages
    //               .length,
    //           itemBuilder: (context, index) => Container(
    //             child: AnimatedRotation(
    //               duration: Duration(milliseconds: 400),
    //               turns: 0,
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 10, horizontal: 70),
    //                 child: CustomProductWrapper(
    //                     imageUrl: widget.product.variations
    //                         .elementAt(0)
    //                         .productVarientImages[index],
    //                     size: 0),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
