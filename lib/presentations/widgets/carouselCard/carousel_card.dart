import 'package:flutter/material.dart';

import '../../../models/models.dart';

class CarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const CarouselCard({super.key, this.category, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(context, '/catalog', arguments: category);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                product == null
                    ? Image.network(category!.imgUrl,
                        fit: BoxFit.cover, width: 1000.0)
                    : Image.network(
                        product!.imgUrl,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(product == null ? category!.name : '',
                        style: Theme.of(context).textTheme.displayMedium),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
