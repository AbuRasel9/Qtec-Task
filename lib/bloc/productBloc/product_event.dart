import 'package:equatable/equatable.dart';

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
