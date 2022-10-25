import 'package:flutter/material.dart';

import '../models/models.dart';

class StarBuckProductCard extends StatelessWidget {
  const StarBuckProductCard({
    Key? key,
    required this.product,
    required this.onTap,
    required this.isShowingProductDetail,
    required this.isActive,
  }) : super(key: key);

  final StarBuckProduct product;
  final VoidCallback onTap;
  final bool isShowingProductDetail;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: const Color(0xFFf0f4ca),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -20,
                      height: 300,
                      left: 0,
                      right: 0,
                      child: Hero(
                        tag: product.name,
                        child: Image.asset(
                          product.imagePath,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFa6ac74),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
