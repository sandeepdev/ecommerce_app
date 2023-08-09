import 'package:buy_india_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cart/cart_bloc.dart';
import '../../../blocs/whishlist/whishlist_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final Product? product;
  final String? title;
  final String screenName;
  const CustomNavBar({
    super.key,
    this.product,
    this.title,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black38,
        child: SizedBox(
            height: 70,
            child: (screenName == '/products')
                ? AddToCartNavbar(product: product!)
                : (screenName == '/cart')
                    ? SingleNameNavbar(
                        title: title!,
                        nextScreen: '/checkout',
                      )
                    : (screenName == '/checkout')
                        ? SingleNameNavbar(
                            title: title!,
                            nextScreen: '/ordernow',
                          )
                        : const HomeNavbar()));
  }
}

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ))
      ],
    );
  }
}

class AddToCartNavbar extends StatelessWidget {
  final Product product;
  const AddToCartNavbar({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            )),
        BlocBuilder<WhishlistBloc, WhishlistState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context
                      .read<WhishlistBloc>()
                      .add(AddtwhisListProduct(product));
                  final snackbar = SnackBar(
                      content: Text(
                    'added to whishlist',
                    style: Theme.of(context).textTheme.displaySmall,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ));
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CartBloc>().add(CartProductAdded(product));
            Navigator.pushNamed(context, '/cart');
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Text(
            'Add to cart',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class SingleNameNavbar extends StatelessWidget {
  final String title;
  final String nextScreen;
  const SingleNameNavbar(
      {super.key, required this.title, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, nextScreen);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: (title == 'order Now')
              ? Text(
                  ' $title',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.black),
                )
              : Text(
                  'Go To $title',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.black),
                ),
        )
      ],
    );
  }
}
