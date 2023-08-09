import 'dart:async';
import 'dart:developer';
import 'package:buy_india_app/repositories/product/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/product_model/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  late StreamSubscription _productSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    _productSubscription = _productRepository
        .getAllProduct()
        .listen((products) => add(UpdateProduct(products)));
    on<ProductEvent>((event, emit) {
      if (event is LoadProduct) {
        log('this is from bloc if event is load product');
        _productSubscription.cancel();
        _productSubscription = _productRepository
            .getAllProduct()
            .listen((products) => emit(UpdateProduct(products) as ProductState));
      }
      if (event is UpdateProduct) {
        emit(ProductLoaded(products: event.products));
      }
    });
  }
}
