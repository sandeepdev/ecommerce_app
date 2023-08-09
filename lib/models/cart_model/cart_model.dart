import 'package:buy_india_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});
  @override
  List<Object?> get props => [products];

  double get subtotal => products.fold(
      0, (previousValue, element) => previousValue + element.price);
  double deliveryfee(subtotal) {
    if (subtotal > 50) {
      return 0.0;
    } else {
      return 20;
    }
  }

  double totalCalc(subtotal, deliveryfee) {
    return subtotal + deliverryfee;
  }

  String freedeliverycheck(subtotal) {
    if (subtotal > 50) {
      return 'You Have Free Delivery';
    } else {
      double missing = 50.0 - subtotal;
      return 'Add ₹$missing For Free Delivery';
    }
  }

  double get deliverryfee => deliveryfee(subtotal);
  String get freedelivery => freedeliverycheck(subtotal);
  double get total => totalCalc(subtotal, deliverryfee);

  Map productQuantity(products) {
    var quantity = {};
    products.forEach((product) {
      if (quantity.containsKey(product)) {
        quantity[product] += 1;
      } else {
        quantity[product] = 1;
      }
    });
    return quantity;
  }
}
