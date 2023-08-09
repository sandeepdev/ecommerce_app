import 'dart:async';
import 'package:buy_india_app/models/category_model/category_model.dart';
import 'package:buy_india_app/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  late StreamSubscription _categorySubscription;
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    _categorySubscription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategory(categories)));
    on<CategoryEvent>((event, emit) {
      if (event is LoadCategory) {
        _categorySubscription.cancel();
        _categorySubscription = _categoryRepository
            .getAllCategories()
            .listen((categories) => add(UpdateCategory(categories)));
      }
      if (event is UpdateCategory) {
        emit(CategoryLoaded(categories: event.categories));
      }
    });
  }
}
