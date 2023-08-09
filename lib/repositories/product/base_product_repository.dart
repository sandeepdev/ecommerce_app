import 'package:buy_india_app/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
}
