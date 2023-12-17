import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';
import 'package:slash/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ListOfProducts(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Product product1 = Product(
    id: 1,
    name: "scarf",
    description: "a scarf",
    brandId: 1,
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    rating: 3,
    variations: [variation1],
    availableProperties: variation1.productPropertiesValues);

ProductVariation variation1 = ProductVariation(
    id: 100,
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
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    brandId: 1,
    rating: 4,
    variations: [
      variation2,
    ],
    availableProperties: variation2.productPropertiesValues);

ProductVariation variation2 = ProductVariation(
    id: 200,
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
      proAndVal2,
      proAndVal3,
      proAndVal4,
      proAndVal5,
      proAndVal6,
      proAndVal7,
    ]);

ProductPropertyAndValue proAndVal2 =
    ProductPropertyAndValue(property: "Color", value: "0xff880000");
ProductPropertyAndValue proAndVal3 =
    ProductPropertyAndValue(property: "Color", value: "0xff000000");
ProductPropertyAndValue proAndVal4 =
    ProductPropertyAndValue(property: "Size", value: "XXL");
ProductPropertyAndValue proAndVal5 =
    ProductPropertyAndValue(property: "Size", value: "XL");
ProductPropertyAndValue proAndVal6 =
    ProductPropertyAndValue(property: "Material", value: "Cotton");
ProductPropertyAndValue proAndVal7 =
    ProductPropertyAndValue(property: "Material", value: "Wool");

List<Product> products = [product1, product2];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0x00000000),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0x00000000))),
      home: Scaffold(
        body: Column(
          children: [
            context.watch<ListOfProducts>().products == null
                ? FloatingActionButton(onPressed: () {
                    setState(() {
                      context.read<ListOfProducts>().products = products;
                    });
                  })
                : HomeScreen(),
          ],
        ),
      ),
    );
  }
}
