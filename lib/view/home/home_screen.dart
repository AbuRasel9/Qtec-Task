import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/productModel/product_model.dart';
import 'package:task/view/home/widget/product_card.dart';
import 'package:task/view/home/widget/sort_item_bottom_sheet.dart';

import '../../bloc/productBloc/product_bloc.dart';
import '../../bloc/productBloc/product_event.dart';
import '../../bloc/productBloc/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              //search feild and sort button
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        context
                            .read<ProductBloc>()
                            .add(SearchProductEvent(searchValue: value));
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: 'Search products',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SortItemBottomSheet(),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/sort_icon.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case ProductStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case ProductStatus.success:
                        //if porduct is empty than show this text
                        return state.productList.isEmpty
                            ? const Center(
                                child: Text("No Data Found"),
                              )
                        //grid view
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: state.productList.length,
                                itemBuilder: (context, index) {
                                  final product = state.productList[index];

                                  //product card item
                                  return  ProductCard(
                                    product: product,
                                    isFavourite: index.isEven,
                                  );
                                },
                              );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
