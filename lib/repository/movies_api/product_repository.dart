
import 'package:task/model/productModel/product_model.dart';

abstract class ProductRepository {
   Future<List<ProductData>> fetchProductList();
}
