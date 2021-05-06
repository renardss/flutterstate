import 'package:ecommerce_state/providers/cart.dart';
import 'package:ecommerce_state/providers/product.dart';
import 'package:ecommerce_state/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },  
          child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          footer: GridTileBar(
            leading: Consumer<Product>(
           builder: (ctx, product, child) => IconButton(icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border), onPressed: (){
              product.toggleFavoriteStatus();
            })),
            backgroundColor: Colors.black87,
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            }
            )
            ),
        ),
    );
  }
}