import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash/model/cart_item.dart';
import 'package:slash/model/product.dart';
import 'package:slash/model/product_list.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';
import 'package:slash/screens/home_screen.dart';
import 'package:slash/screens/my_cart.dart';

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

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<ListOfProducts>().products = [];
    context.read<CartItem>().cartItems = [];

    context.read<ListOfProducts>().addProduct(product1);
    context.read<ListOfProducts>().addProduct(product2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0x00000000),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0x00000000))),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HomeScreen(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                  builder: (BuildContext builderContext) => IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(builderContext).push(MaterialPageRoute(
                        builder: (context) => const MyCart(),
                      ));
                    },
                    icon: const Icon(Icons.shopping_cart_rounded),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
