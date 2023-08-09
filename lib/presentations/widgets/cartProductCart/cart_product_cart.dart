import 'package:buy_india_app/blocs/cart/cart_bloc.dart';
import 'package:buy_india_app/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantiy;

  const CartProductCard({super.key, required this.product, required this.quantiy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.network(
            product.imgUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  '₹${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      },
                      icon: const Icon(Icons.remove_circle)),
                  Text(
                    '$quantiy',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      },
                      icon: const Icon(Icons.add_circle))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
