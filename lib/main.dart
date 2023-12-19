import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/cart_item.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';
import 'package:slash/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ListOfProducts(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartItem(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Product product1 = Product(
    id: 1,
    currentVariationId: 100,
    name: "scarf",
    description: "a scarf",
    brandId: 1,
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    rating: 3,
    variations: [variation1],
    availableProperties: variation1.productPropertiesValues);

Product product2 = Product(
    id: 2,
    currentVariationId: 200,
    name: "bag",
    description: "a bag",
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    brandId: 1,
    rating: 4,
    variations: [variation2, variation1, variation3],
    availableProperties: []);

ProductVariation variation1 = ProductVariation(
    id: 100,
    productId: 1,
    price: 200,
    quantity: 20,
    inStock: true,
    productVarientImages: ["Assets/Images/hmgoepprod.jpeg"],
    productPropertiesValues: [proAndVal1, proAndVal3, proAndVal7]);

ProductVariation variation2 = ProductVariation(
    id: 200,
    productId: 2,
    price: 20,
    quantity: 2,
    inStock: true,
    productVarientImages: [
      "Assets/Images/bag.jpg",
      "Assets/Images/gettyimages-167759603-612x612.jpg"
    ],
    productPropertiesValues: [
      proAndVal2,
      proAndVal4,
      proAndVal6
    ]);
ProductVariation variation3 = ProductVariation(
  id: 300,
  productId: 2,
  price: 2000,
  quantity: 2,
  inStock: true,
  productVarientImages: [
    "Assets/Images/bag.jpg",
    "Assets/Images/gettyimages-167759603-612x612.jpg"
  ],
  productPropertiesValues: [proAndVal2, proAndVal3],
);

ProductPropertyAndValue proAndVal1 =
    ProductPropertyAndValue(property: "Color", value: "0xffffff00");
ProductPropertyAndValue proAndVal2 =
    ProductPropertyAndValue(property: "Color", value: "0xffffffff");
ProductPropertyAndValue proAndVal3 =
    ProductPropertyAndValue(property: "Size", value: "M");

ProductPropertyAndValue proAndVal4 =
    ProductPropertyAndValue(property: "Size", value: "XXL");
ProductPropertyAndValue proAndVal5 =
    ProductPropertyAndValue(property: "Size", value: "XL");
ProductPropertyAndValue proAndVal6 =
    ProductPropertyAndValue(property: "Material", value: "Cotton");
ProductPropertyAndValue proAndVal7 =
    ProductPropertyAndValue(property: "Material", value: "Wool");

List<ProductPropertyAndValue> productPropertiesValues = [
  proAndVal2,
  proAndVal3,
  proAndVal4,
  proAndVal5,
  proAndVal6,
  proAndVal7,
];
List<Product> products = [product1, product2];

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<ListOfProducts>().products = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ListOfProducts>().addProduct(product1);
    context.read<ListOfProducts>().addProduct(product2);

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0x00000000),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0x00000000))),
      home: const Scaffold(
        body: Column(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
