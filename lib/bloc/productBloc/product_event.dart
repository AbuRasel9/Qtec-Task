import 'package:equatable/equatable.dart';

enum SortOption {
  priceHighToLow,
  priceLowToHigh,
  rating,
  initial
}

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductEvent extends ProductEvent {}

class SearchProductEvent extends ProductEvent {
  final String searchValue;

  const SearchProductEvent({required this.searchValue});

  @override
  List<Object?> get props => [searchValue];
}

class SortProductEvent extends ProductEvent {
  final SortOption sortOption;

  const SortProductEvent({required this.sortOption});

  @override
  List<Object?> get props => [sortOption];
}