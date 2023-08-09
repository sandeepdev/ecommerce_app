import 'package:buy_india_app/models/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});
  static const String routeName = '/products';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: product.name,
        ),
        bottomNavigationBar:  CustomNavBar(screenName: routeName,product: product),
        body: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.3,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                ),
                items: [
                  CarouselCard(
                    product: product,
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Container(
                    height: 70,
                    color: Colors.black.withAlpha(50),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    margin: const EdgeInsets.all(7),
                    height: 56,
                    color: Colors.black,
                    // alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width - 14,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            '${product.price}',
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'product information',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professo',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  'Delivery information',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professo',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
