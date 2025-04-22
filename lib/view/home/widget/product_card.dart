import 'package:flutter/material.dart';

import '../../../model/productModel/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductData product;
  final bool isFavourite;

  const ProductCard(
      {super.key, required this.product, required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOutOfStock = product.rating?.count == 0;
    double discountPercentage = 2;

    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Center(
                  child: Image.network(
                    product.image ?? "",
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Product Title
                Text(
                  product.title ?? "",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Price and Discount
                Row(
                  children: [
                    Text(
                      '\$${product.price?.toStringAsFixed(2) ?? "0.00"}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${(product.price! * (1 + discountPercentage / 100)).toStringAsFixed(2)}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${discountPercentage.toStringAsFixed(0)}% OFF',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      ' ${product.rating?.rate?.toStringAsFixed(1) ?? "0.0"}',
                      style: theme.textTheme.labelSmall,
                    ),
                    Text(
                      ' (${50})',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Out of Stock Badge (if applicable)
                if (isOutOfStock)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Out Of Stock',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Favorite Button
          Positioned(
            top: -4,
            right: -5,
            child: IconButton(
          /*    style: IconButton.styleFrom(
                backgroundColor: Colors.white,
              ),*/
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border,
                color: isFavourite
                    ? theme.colorScheme.error
                    : theme.colorScheme.onSurface,
              ),
              onPressed: () {
                // Toggle favorite status
              },
            ),
          ),
        ]));
  }
}
