import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/models/products.dart';

class ProductTile extends StatelessWidget {
  final Welcome product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen size information
    final screenSize = MediaQuery.of(context).size;

    // Calculate the image height based on the screen size
    final imageHeight = screenSize.width * 0.181;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: imageHeight,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                         product.isFavorite.toggle();
                        },
                      ),
                    )),
                  )
                ],
              ),
              const SizedBox(height: 2),
              Text(
                product.name,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  fontSize: 12, // Use relative font size
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 2),
              Text(
                'Kes ${product.price}',
                style: const TextStyle(fontSize: 18, fontFamily: 'Nunito'), // Use relative font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
