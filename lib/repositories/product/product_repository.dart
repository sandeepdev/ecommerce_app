import 'package:buy_india_app/models/models.dart';
import 'package:buy_india_app/repositories/product/base_product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    
    
    return _firebaseFirestore.collection('products').snapshots().map((snap) {
      return snap.docs.map((doc) {
        return Product.fromSnapshot(doc);
      }).toList();
    });
  }
}
