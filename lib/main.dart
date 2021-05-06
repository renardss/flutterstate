import 'package:ecommerce_state/providers/cart.dart';
import 'package:ecommerce_state/providers/products_provider.dart';
import 'package:ecommerce_state/screens/product_detail_screen.dart';
import 'package:ecommerce_state/screens/products_overview_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart()
          )
        ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()
        },
      ),
    );
  }
}
