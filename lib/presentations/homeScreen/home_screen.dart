import 'package:buy_india_app/blocs/category/category_bloc.dart';
import 'package:buy_india_app/models/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Buy India',
        ),
        body: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.3,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                    ),
                    items: state.categories
                        .map((category) => CarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Text('error');
                }
              },
            ),
            const SectionTitle(
              title: 'RECOMMENDED',
            ), //PRODUCT CARD

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                // if (state is ProductLoading) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                if (state is ProductLoading) {
                  return ProductCarousel(
                    products: Product.products
                        .where((products) => products.recomended)
                        .toList(),
                  );
                } else {
                  return const Text('error');
                }
              },
            ),
            const SectionTitle(
              title: 'MOST POPULAR',
            ), //PRODUCT CARD

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                // if (state is ProductLoading) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                if (state is ProductLoading) {
                  return ProductCarousel(
                    products: Product.products
                        .where((product) => product.isPopular)
                        .toList(),
                  );
                } else {
                  return const Text('error');
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: const CustomNavBar(screenName: routeName),
      ),
    );
  }
}
