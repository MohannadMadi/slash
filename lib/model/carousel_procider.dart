// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class CarouselProvider with ChangeNotifier {
  CarouselController? buttonCarouselController;
  double angle = 0;
  CarouselProvider({
    this.buttonCarouselController,
  });

  void setAngleToZero() {
    angle = 0;
    buttonCarouselController!.jumpToPage(0);
    notifyListeners();
  }
}
