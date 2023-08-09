part of 'whishlist_bloc.dart';

abstract class WhishlistEvent extends Equatable {
  const WhishlistEvent();

  @override
  List<Object> get props => [];
}

class StartwhisList extends WhishlistEvent {}

class AddtwhisListProduct extends WhishlistEvent {
  final Product product;

  const AddtwhisListProduct(this.product);
  @override
  List<Object> get props => [product];
}

class RemovetwhisListProduct extends WhishlistEvent {
  final Product product;

  const RemovetwhisListProduct(this.product);
  @override
  List<Object> get props => [product];
}
