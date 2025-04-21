import 'package:equatable/equatable.dart';
import 'package:task/model/productModel/product_model.dart';

enum ProductStatus { loading, error, success, progress }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<ProductData> productList;
  final String message;

  const ProductState(
      {this.message = "",
      this.status = ProductStatus.progress,
      this.productList = const []});

  ProductState copyWith({
    ProductStatus? status,
    List<ProductData>? productList,
    String? message,
  }) {
    return ProductState(
      message: message ?? this.message,
      status: status ?? this.status,
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        productList,
        message,
      ];
}
