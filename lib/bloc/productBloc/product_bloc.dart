import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/productBloc/product_event.dart';
import 'package:task/bloc/productBloc/product_state.dart';
import 'package:task/model/productModel/product_model.dart';
import 'package:task/repository/movies_api/product_repository.dart';
import '../../utils/search.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<ProductData> searchResults = [];

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<GetProductEvent>(_getProduct);
    on<SearchProductEvent>(_searchItem);
    on<SortProductEvent>(_sortProducts);
  }

  Future<void> _getProduct(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await productRepository.fetchProductList();
      emit(state.copyWith(
        productList: products,
        originalProductList: products,
        message: "Success",
        status: ProductStatus.success,
      ));
    } catch (error, stackTrace) {
      log("Error: $error");
      log("Stack trace: $stackTrace");
      emit(state.copyWith(
        status: ProductStatus.error,
        message: error.toString(),
      ));
    }
  }

  void _searchItem(SearchProductEvent event, Emitter<ProductState> emit) {
    if (event.searchValue.isEmpty) {
      emit(state.copyWith(
        productList: state.originalProductList,
        message: "",
      ));
    } else {
      searchResults = Search.find(
        items: state.originalProductList,
        q: event.searchValue,
      );
      emit(state.copyWith(
        productList: searchResults,
        message: searchResults.isEmpty ? "No results found" : "",
      ));
    }
  }

  void _sortProducts(SortProductEvent event, Emitter<ProductState> emit) {
    if (state.productList.isEmpty) return;

    List<ProductData> sortedList = List.from(state.productList);

    switch (event.sortOption) {
      case SortOption.priceHighToLow:
        emit(state.copyWith(sortOption: SortOption.priceHighToLow));
        sortedList.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
        break;
      case SortOption.priceLowToHigh:
        emit(state.copyWith(sortOption: SortOption.priceLowToHigh));

        sortedList.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
        break;
      case SortOption.rating:
        emit(state.copyWith(sortOption: SortOption.rating));

        sortedList.sort(
            (a, b) => (b.rating?.rate ?? 0).compareTo(a.rating?.rate ?? 0));
        break;
      case SortOption.initial:
        break;
    }

    emit(state.copyWith(productList: sortedList));
  }
}
