import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import '../providers/cart.dart';
// import '../providers/products.dart';
// import '../providers/product.dart';

enum FilterValues {
  favourites,
  all
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterValues selectedValue) {
              setState(() {
                if(selectedValue == FilterValues.favourites) {
                  _showFav = true;
                }
                else {
                  _showFav = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text("Only Favourites"),
                  value: FilterValues.favourites,
                ),
                const PopupMenuItem(
                child: Text("Show All"),
                value: FilterValues.all,
                ),
              ],
          ),
          Consumer<Cart>(
            builder: (_,cart,ch) => Badge(
                value: cart.getItemCount.toString(),
              child: ch as Widget,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showFav),
    );
  }
}

