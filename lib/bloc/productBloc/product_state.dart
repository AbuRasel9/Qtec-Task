import 'package:equatable/equatable.dart';
import 'package:task/bloc/productBloc/product_event.dart';
import 'package:task/model/productModel/product_model.dart';

enum ProductStatus { initial, loading, success, error }

class ProductState extends Equatable {
  final List<ProductData> productList;
  final List<ProductData> originalProductList;
  final ProductStatus status;
  final String message;
  final SortOption sortOption;

  const ProductState({
    this.sortOption=SortOption.initial,
    this.productList = const [],
    this.originalProductList = const [],
    this.status = ProductStatus.initial,
    this.message = '',
  });

  ProductState copyWith({
    SortOption? sortOption,
    List<ProductData>? productList,
    List<ProductData>? originalProductList,
    ProductStatus? status,
    String? message,
  }) {
    return ProductState(
      productList: productList ?? this.productList,
      originalProductList: originalProductList ?? this.originalProductList,
      status: status ?? this.status,
      message: message ?? this.message,
      sortOption: sortOption ?? this.sortOption
    );
  }

  @override
  List<Object?> get props => [productList, originalProductList, status, message,sortOption];
}