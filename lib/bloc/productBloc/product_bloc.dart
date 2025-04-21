import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/productBloc/product_event.dart';
import 'package:task/bloc/productBloc/product_state.dart';
import 'package:task/repository/movies_api/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<GetProductEvent>(_getProduct);
  }

  Future<void> _getProduct(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    await productRepository.fetchProductList().then(
      (value) {
        emit(

          state.copyWith(
            productList: value,
            message: "Success",
            status: ProductStatus.success,
          ),
        );
        print(value);
      },
    ).onError(
      (error, stackTrace) {
        print("error  $error");
        print("line no $stackTrace");
        emit(state.copyWith(
            status: ProductStatus.error, message: error.toString()));
      },
    );
  }
}
