import 'package:buy_india_app/models/product_model/product_model.dart';
import 'package:buy_india_app/presentations/widgets/productCard/product_card.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ProductCard(product: products[index]),
          ),
        ),
      ),
    );
  }
}
