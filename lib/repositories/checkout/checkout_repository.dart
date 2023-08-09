import 'package:buy_india_app/models/checkout_model/checkout_model.dart';
import 'package:buy_india_app/repositories/checkout/base_checkout_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout) {
     return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
