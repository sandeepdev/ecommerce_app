import 'package:buy_india_app/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  final Category category;
  const CatalogScreen({
    super.key,
    required this.category,
  });
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryproducts = Product.products
        .where((product) => product.category == category.name)
        .toList();

    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: category.name,
          ),
          bottomNavigationBar: const CustomNavBar(screenName: routeName
          ),
          body: GridView.builder(
            padding: const EdgeInsets.only(left: 25, top: 25),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemCount: categoryproducts.length,
            itemBuilder: (context, index) {
              return Center(
                widthFactor: 2.2,
                child: ProductCard(product: categoryproducts[index]),
              );
            },
          )),
    );
  }
}
