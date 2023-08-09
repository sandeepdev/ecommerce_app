part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;

  CheckoutLoaded(
  {this.fullName,
  this.email,
  this.address,
  this.city,
  this.zipCode,
  this.country,
  this.subtotal,
  this.deliveryfee,
  this.total,
  this.products}
  ) : checkout = Checkout(
          address: address,
          city: city,
          zipCode: zipCode,
          country: country,
          subtotal: subtotal,
          deliveryfee: deliveryfee,
          total: total,
          products: products,
          fullName: fullName,
          email: email);

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
}
