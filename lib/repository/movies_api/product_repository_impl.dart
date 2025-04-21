import 'dart:convert';

import 'package:task/model/productModel/product_model.dart';
import 'package:task/repository/movies_api/product_repository.dart';

import '../../data/network/network_api_services.dart';
import '../../utils/app_url.dart';

class ProductRepositoryImpl implements ProductRepository {
  final _apiServices = NetworkApiService();

  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  @override
  Future<List<ProductData>> fetchProductList() async {
    final response = await _apiServices.getApi(AppUrl.productUrl);
    return List<ProductData>.from(
        jsonDecode(response.body).map((value) => ProductData.fromJson(value)));
  }
}
