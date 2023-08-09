
import 'package:buy_india_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistLoading()) {
    on<StartwhisList>((event, emit) async {
      emit(WhishlistLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const WhishlistLoadded());
      } catch (_) {}
    });
    on<AddtwhisListProduct>((event, emit) {
      final currentWishlist = (state as WhishlistLoadded).whishlist.products;
      if (state is WhishlistLoadded) {
        emit(WhishlistLoadded(
            whishlist: WishList(
                products: List.from(currentWishlist)..add(event.product))));
      }
    });
    on<RemovetwhisListProduct>((event, emit) {
      final currentWishlist = (state as WhishlistLoadded).whishlist.products;
      if (state is WhishlistLoadded) {
        emit(WhishlistLoadded(
            whishlist: WishList(
                products: List.from(currentWishlist)..remove(event.product))));
      }
    });
  }
}
