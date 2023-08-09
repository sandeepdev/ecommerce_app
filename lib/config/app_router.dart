import 'package:buy_india_app/models/models.dart';
import 'package:buy_india_app/presentations/allScreens/all_screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is route:${settings.name}');
    switch (settings.name) {
      

      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WhishlistScreen.routeName:
        return WhishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }
}

Route _errorRoute() {
  return MaterialPageRoute(
    settings: const RouteSettings(name: '/error'),
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
    ),
  );
}
