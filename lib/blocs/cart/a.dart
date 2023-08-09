

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:buy_india_app/models/models.dart';
// import 'package:equatable/equatable.dart';

// part 'wish_list_event.dart';
// part 'wish_list_state.dart';

// class WishListBloc extends Bloc<WishListEvent, WishListState> {
//   WishListBloc() : super(WishListIsLoading());
//   on<StartWishlist>((event, emit) {emit (WishListIsLoading());try {
//       await Future<void>.delayed(const Duration(seconds: 1));
//       emit(const WishListLoaded());
//     } catch (_) {}
//     // TODO: implement event handler

//   });

//   Stream<WishListState> mapEventToState(WishListEvent event) async* {
//     if (event is StartWishlist) {
//       yield* _mapStartWishlistToState();
//     } else if (event is AddWishlistProduct) {
//       yield* _mapAddWishlistToState(event,state);
//     } else if (event is RemoveWishlist) {
//       yield* _mapRemoveWishlistToState(event,state);
//     }
//   }
   
//   Stream<WishListState> _mapStartWishlistToState() async* {
//     // Add your logic for handling the StartWishlist event here
//     // You can fetch data, make API calls, or perform any other tasks needed
//     // For now, let's just yield a loading state
//     yield WishListIsLoading();
//     try {
//       await Future<void>.delayed(const Duration(seconds: 1));
//       yield const WishListLoaded();
//     } catch (_) {}
//   }

//   Stream<WishListState> _mapAddWishlistToState(
//       AddWishlistProduct event, WishListState state) async* {
//     // Add your logic for handling the AddWishlist event here
//     // For now, let's just yield a loading state
//     if (state is WishListLoaded) {
//       try {
//         yield WishListLoaded(
//             wishlist: WishList(
//                 products: List.from(state.wishlist.products)
//                   ..add(event.product)));
//       } catch (_) {}
//     }
//   }

//   Stream<WishListState> _mapRemoveWishlistToState(
//       RemoveWishlist event, WishListState state) async* {
//     if (state is WishListLoaded) {
//       try {
//         yield WishListLoaded(
//             wishlist: WishList(
//                 products: List.from(state.wishlist.products)
//                   ..remove(event.product)));
//       } catch (_) {}
//     }

//     // Add your logic for handling the RemoveWishlist event here
//     // For now, let's just yield a loading state
//     yield WishListIsLoading();
//   }
// }
// part of 'wish_list_bloc.dart';

// abstract class WishListEvent extends Equatable {
//   const WishListEvent();

//   @override
//   List<Object> get props => [];
// }

// class StartWishlist extends WishListEvent {}

// class AddWishlistProduct extends WishListEvent {
//   final Product product;
//   const AddWishlistProduct({required this.product});
//   @override
//   List<Object> get props => [product];
// }

// class RemoveWishlist extends WishListEvent {
//   final Product product;
//   const RemoveWishlist({required this.product});
//   @override
//   List<Object> get props => [product];
// }
// part of 'wish_list_bloc.dart';

// abstract class WishListState extends Equatable {


//   const WishListState();

//   @override
//   List<Object> get props => [];
// }

// class WishListIsLoading extends WishListState {}

// class WishListLoaded extends WishListState {
//   final WishList wishlist;
//   const WishListLoaded({this.wishlist = const WishList()});

//   @override
//   List<Object> get props => [wishlist];
// }

// class WishListIsError extends WishListState {}
