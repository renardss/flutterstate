import 'package:ecommerce_state/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);
  static const routeName = '/product-detail';
  
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; // is id
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(productId);
        //  .items.firstWhere((prod) => prod.id == productId);
    //...
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      
    );
  }
}