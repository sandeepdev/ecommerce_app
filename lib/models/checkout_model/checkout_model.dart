import 'package:buy_india_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? zipCode;
  final String? country;
  final double? subtotal;
  final double? deliveryfee;
  final double? total;
  final List<Product>? products;

  const Checkout(
      {required this.address,
      required this.city,
      required this.zipCode,
      required this.country,
      required this.subtotal,
      required this.deliveryfee,
      required this.total,
      required this.products,
      required this.fullName,
      required this.email});
  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        zipCode,
        country,
        subtotal,
        deliveryfee,
        total,
        products
      ];
  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['zipCode'] = zipCode;
    customerAddress['country'] = country;
    return {
      'customerAddress': customerAddress,
      'FullName': fullName!,
      'email': email!,
      'subtotal': subtotal!,
      'deliveryFee': deliveryfee!,
      'total': total!,
      'product': products!.map((product) => product.name).toList()
    };
  }
}
