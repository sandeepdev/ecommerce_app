import 'package:buy_india_app/blocs/whishlist/whishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});
  static const String routeName = '/whishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WhishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: 'WHISHLIST',
          ),
          bottomNavigationBar: const CustomNavBar(
            screenName: routeName,
          ),
          body: BlocBuilder<WhishlistBloc, WhishlistState>(
              builder: (context, state) {
            if (state is WhishlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WhishlistLoadded) {
              return GridView.builder(
                padding: const EdgeInsets.only(left: 25, top: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemCount: state.whishlist.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard(
                      widthfactor: 1.1,
                      leftPosition: 130,
                      product: state.whishlist.products[index],
                      isWishlist: true,
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('something went wrong'),
              );
            }
          })),
    );
  }
}
