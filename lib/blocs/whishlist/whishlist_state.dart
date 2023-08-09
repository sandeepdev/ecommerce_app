part of 'whishlist_bloc.dart';

abstract class WhishlistState extends Equatable {
  const WhishlistState();

  @override
  List<Object> get props => [];
}

class WhishlistLoading extends WhishlistState {}

class WhishlistLoadded extends WhishlistState {
  final WishList whishlist;

  const WhishlistLoadded({this.whishlist = const WishList()});
  @override
  List<Object> get props => [whishlist];
}

class WhishlistError extends WhishlistState {}
