import 'package:buy_india_app/models/category_model/category_model.dart';
import 'package:buy_india_app/repositories/category/base_category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('catagory')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromsnapshot(doc)).toList();
    });
  }
}
