import 'package:flutter/material.dart';

// import 'ui/products/products_manager.dart';
// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/product_overview_screen.dart';
// import 'ui/products/user_products_screen.dart';
// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';

import 'package:provider/provider.dart';

import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
      ],
      child: MaterialApp(

    // return MaterialApp(
    //   title: 'MyShop',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     fontFamily: 'Lato',
    //     colorScheme: ColorScheme.fromSwatch(
    //       primarySwatch: Colors.purple,
    //     ).copyWith(
    //       secondary: Colors.deepOrange,
    //     ),
    //   ),


      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('MyShop'),
      //   ),
      //   body: const Center(
      //     child: Text('Welcome to MyShop'),
      //   ),
      // ),

      home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: 
            (ctx) => const CartScreen(),
          OrdersScreen.routeName: 
            (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName:
            (ctx) => const UserProductsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId)!,
                );
              },
            );
          }

          return null;
        },
      ),
      // home: const SafeArea(
      //   child: OrdersScreen(),
      //     // ProductsManager().items[0],
      //   // ),
      // ),
    );
  }
}
