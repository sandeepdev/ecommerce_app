

import 'package:buy_india_app/models/cart_model/cart_model.dart';
import 'package:buy_india_app/models/product_model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>((event, emit) async {
      emit(CartLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const CartLoaded());
      } catch (_) {}
    });
    on<CartProductAdded>((event, emit) {
      try {
        if (state is CartLoaded) {
          
           final currentCart = (state as CartLoaded).cart;
          emit(CartLoaded(
              cart: Cart(
                  products: List.from(currentCart.products)
                    ..add(event.product))));
        }
      } catch (_) {}
    });
    on<CartProductRemoved>((event, emit) {
      if (state is CartLoaded) {
        final currentCart = (state as CartLoaded).cart;
        emit(CartLoaded(
            cart: Cart(
                products: List.from(currentCart.products)
                  ..remove(event.product))));
      }
    });
  }
}
