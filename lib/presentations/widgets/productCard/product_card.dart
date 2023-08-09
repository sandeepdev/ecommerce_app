import 'package:buy_india_app/blocs/cart/cart_bloc.dart';
import 'package:buy_india_app/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthfactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard(
      {super.key,
      required this.product,
      this.widthfactor = 2.5,
      this.leftPosition = 5,
      this.isWishlist = false});

  @override
  Widget build(BuildContext context) {
    final double widthvalue = MediaQuery.of(context).size.width / widthfactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/products', arguments: product);
      },
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: widthvalue,
              height: 150,
              child: Image.network(
                product.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                width: widthvalue - 5 - leftPosition,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
            ),
            Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                width: widthvalue - 15 - leftPosition,
                height: 70,
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartProductAdded(product));

                                    final snackbar = SnackBar(
                                      content: Text(
                                        'added to cart',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 800),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  )));
                        } else {
                          return const Text('error');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
