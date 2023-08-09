import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final bool recomended;
  final bool isPopular;
  const Product(
      {required this.name,
      required this.imgUrl,
      required this.category,
      required this.price,
      required this.isPopular,
      required this.recomended});

  static Product fromSnapshot(DocumentSnapshot snap) {
    // String datas1 = snap['imgUrl'];
    // String datas2 = snap['category'];
    // String datas3 = snap['price'];
    // String datas4 = snap['isPopular'].toString();
    // // String datas5 = snap['recomended'].toString();

    // Print the Firestore data
    Product product = Product(
        name: snap['name'],
        imgUrl: snap['imgUrl'],
        category: snap['category'],
        price: snap['price'],
        isPopular: snap['isPopular'],
        recomended: snap['recomended']);
    return product;
  }

  @override
  List<Object?> get props =>
      [name, category, imgUrl, price, recomended, isPopular];
  static List<Product> products = [
    const Product(
        name: 'soft drink1',
        imgUrl:
            'https://images.unsplash.com/photo-1524802020103-aa46eaffcaa2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
        category: 'soft drink',
        price: 35,
        isPopular: true,
        recomended: false),
    const Product(
        name: 'soft drink2',
        imgUrl:
            'https://images.unsplash.com/photo-1567103472667-6898f3a79cf2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        category: 'soft drink',
        price: 44,
        isPopular: false,
        recomended: true),
    const Product(
        name: 'soft drink3',
        imgUrl:
            'https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        category: 'soft drink',
        price: 55,
        isPopular: true,
        recomended: true),
    const Product(
        name: 'smoothie1',
        imgUrl:
            'https://images.unsplash.com/photo-1589734580748-6d9421464885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=689&q=80',
        category: 'smoothies',
        price: 12,
        isPopular: false,
        recomended: true),
    const Product(
        name: 'smoothie2',
        imgUrl:
            'https://images.unsplash.com/photo-1629386041528-f0a0538276b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        category: 'smoothies',
        price: 13,
        isPopular: true,
        recomended: false),
    const Product(
        name: 'smoothie3',
        imgUrl:
            'https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        category: 'smootheis',
        price: 99,
        isPopular: true,
        recomended: true)
  ];
}
