import 'package:ecommerce_state/providers/cart.dart';
import 'package:ecommerce_state/providers/product.dart';
import 'package:ecommerce_state/providers/products_provider.dart';
import 'package:ecommerce_state/widgets/badge.dart';
import 'package:ecommerce_state/widgets/product_item.dart';
import 'package:ecommerce_state/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = true;
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Shop de Royale"), 
      actions: <Widget> [
       PopupMenuButton(
       onSelected: (FilterOptions selectedValue) {
         setState(() {
        if(selectedValue == FilterOptions.Favorites) {
         _showOnlyFavorites = true;
        } else {
         _showOnlyFavorites = false;
        }
      });
       },
       icon: Icon(Icons.more_vert), 
       itemBuilder: (_) => [
         PopupMenuItem(child: Text("Favorite"), value: FilterOptions.Favorites),
         PopupMenuItem(child: Text("All"), value: FilterOptions.All)
       ]),
       Consumer<Cart>(builder: (_, cart, ch) => Badge(
       child: ch,
       value: cart.itemCount.toString()
       ),
       child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
       ) 
      ],),
      body: ProductsGrid(_showOnlyFavorites)
    );
  }
}

