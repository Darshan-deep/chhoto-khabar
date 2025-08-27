// features/category/bloc/category_state.dart
import 'package:equatable/equatable.dart';
import '../../../data/models/category_response_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final CategoryResponse categoryResponse;

  const CategoryLoaded(this.categoryResponse);

  @override
  List<Object?> get props => [categoryResponse];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}