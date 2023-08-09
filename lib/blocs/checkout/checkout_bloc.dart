import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buy_india_app/blocs/cart/cart_bloc.dart';
import 'package:buy_india_app/models/models.dart';
import 'package:buy_india_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';


part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartbloc;
  CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartsubscription;
  StreamSubscription? _checkoutsubscription;
  CheckoutBloc(
      {required CartBloc cartbloc,
      required CheckoutRepository checkoutrepository})
      : _cartbloc = cartbloc,
        _checkoutRepository = checkoutrepository,
        super(cartbloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartbloc.state as CartLoaded).cart.products,
                total: (cartbloc.state as CartLoaded).cart.total,
                subtotal: (cartbloc.state as CartLoaded).cart.subtotal,
                deliveryfee: (cartbloc.state as CartLoaded).cart.deliverryfee)
            : CheckoutLoading()) {
    _cartsubscription = cartbloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
      {}
    });
    on<UpdateCheckout>((event, emit) {
      if (state is CheckoutLoaded) {
        // ignore: no_leading_underscores_for_local_identifiers
        CheckoutLoaded _checkoutLoaded = state as CheckoutLoaded;
        emit(CheckoutLoaded(
            address: event.address ?? _checkoutLoaded.address,
            email: event.email ?? _checkoutLoaded.email,
            products: event.cart?.products ?? _checkoutLoaded.products,
            deliveryfee: event.cart?.deliverryfee,
            subtotal: event.cart?.subtotal ?? _checkoutLoaded.subtotal,
            total: event.cart?.total ?? _checkoutLoaded.total,
            city: event.city ?? _checkoutLoaded.city,
            country: event.country ?? _checkoutLoaded.country,
            fullName: event.fullName ?? _checkoutLoaded.fullName,
            zipCode: event.zipCode ?? _checkoutLoaded.zipCode));
      }
    });
    on<ConfirmCheckout>((event, emit) async {
      _checkoutsubscription?.cancel();
      if (state is CheckoutLoaded) {
        try {
          await _checkoutRepository.addCheckout(event.checkout);
          print('done confirm checkout');
          emit(CheckoutLoading());
        } catch (e) {}
      }
    });
  }
}
