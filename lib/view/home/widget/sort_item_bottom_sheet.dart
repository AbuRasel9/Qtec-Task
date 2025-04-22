import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/configs/components/powered_by_widget.dart';
import 'package:task/utils/extensions/context_ext.dart';

import '../../../bloc/productBloc/product_bloc.dart';
import '../../../bloc/productBloc/product_event.dart';

class SortItemBottomSheet extends StatefulWidget {
  const SortItemBottomSheet({super.key});

  @override
  State<SortItemBottomSheet> createState() => _SortItemBottomSheetState();
}

class _SortItemBottomSheetState extends State<SortItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Sort By', style: theme.textTheme.bodyLarge),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_outlined))
            ],
          ),
          ListTile(
            leading: Checkbox(
              value: context.read<ProductBloc>().state.sortOption ==
                  SortOption.priceHighToLow,
              onChanged: (value) {},
            ),
            title: const Text('Price - High to Low'),
            onTap: () {
              context.read<ProductBloc>().add(
                    const SortProductEvent(
                        sortOption: SortOption.priceHighToLow),
                  );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Checkbox(
                value: context.read<ProductBloc>().state.sortOption ==
                    SortOption.priceLowToHigh,
                onChanged: (value) {}),
            title: const Text('Price - Low to High'),
            onTap: () {
              context.read<ProductBloc>().add(
                    const SortProductEvent(
                        sortOption: SortOption.priceLowToHigh),
                  );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Checkbox(
                value: context.read<ProductBloc>().state.sortOption ==
                    SortOption.rating,
                onChanged: (value) {
                  print(
                      "rating --------${context.read<ProductBloc>().state.sortOption}");
                }),
            title: const Text('Rating'),
            onTap: () {
              context.read<ProductBloc>().add(
                    const SortProductEvent(sortOption: SortOption.rating),
                  );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    // return showModalBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Padding(
    //           padding: EdgeInsets.all(16.0),
    //           child: Text(
    //               'Sort By',
    //               style:
    //           ),
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.arrow_downward),
    //           title: const Text('Price - High to Low'),
    //           onTap: () {
    //             context.read<ProductBloc>().add(
    //               const SortProductEvent(sortOption: SortOption.priceHighToLow),
    //             );
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.arrow_upward),
    //           title: const Text('Price - Low to High'),
    //           onTap: () {
    //             context.read<ProductBloc>().add(
    //               const SortProductEvent(sortOption: SortOption.priceLowToHigh),
    //             );
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.star),
    //           title: const Text('Rating'),
    //           onTap: () {
    //             context.read<ProductBloc>().add(
    //               const SortProductEvent(sortOption: SortOption.rating),
    //             );
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );;
  }
}
