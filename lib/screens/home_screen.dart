import 'package:flutter/material.dart';
import 'package:slash/custom_widgets/horizontal_scroll_widget.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Product product1 = Product(
    id: 1,
    name: "scarf",
    description: "a scarf",
    brandId: 1,
    rating: 3,
    variations: [variation1],
    availableProperties: variation1.productPropertiesValues);

ProductVariation variation1 = ProductVariation(
    id: 1,
    productId: 1,
    price: 200,
    quantity: 20,
    inStock: true,
    productVarientImages: ["Assets/Images/hmgoepprod.jpeg"],
    productPropertiesValues: [proAndVal1]);

ProductPropertyAndValue proAndVal1 =
    ProductPropertyAndValue(property: "Color", value: "0xffffff");

Product product2 = Product(
    id: 2,
    name: "bag",
    description: "a bag",
    brandId: 1,
    rating: 4,
    variations: [variation2],
    availableProperties: variation2.productPropertiesValues);

ProductVariation variation2 = ProductVariation(
    id: 2,
    productId: 2,
    price: 20,
    quantity: 2,
    inStock: true,
    productVarientImages: [
      "Assets/Images/bag.jpg",
      "Assets/Images/ipad.jpg",
      "Assets/Images/ipad.jpg",
      "Assets/Images/ipad.jpg"
    ],
    productPropertiesValues: [
      proAndVal2
    ]);

ProductPropertyAndValue proAndVal2 =
    ProductPropertyAndValue(property: "Color", value: "0x000000");

List<Product> products = [product1, product2];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomHorizontalScroll(
      items: products,
      label: "scarfs",
    );
  }
}
