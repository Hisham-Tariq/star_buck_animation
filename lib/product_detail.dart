import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:star_buck_animation/constants/constants.dart';
import 'package:star_buck_animation/models/models.dart';

import 'services/home_service.dart';
import 'widgets/widgets.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.product});
  final StarBuckProduct product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final service = GetIt.I.get<HomeService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BackgroundCurveShape(
        //   begin: 0.65,
        //   end: 2.0,
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: const BackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            title: const Text(
              "Details",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Badge(
                  elevation: 0.0,
                  badgeContent: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.shopping_basket_outlined,
                  ),
                ),
                color: Colors.black,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  children: const [
                    _TabPills(title: "Active Orders", isActive: true),
                    SizedBox(width: 8),
                    _TabPills(title: "Past Orders", isActive: false)
                  ],
                ),
                Center(
                  child: Hero(
                    tag: widget.product.name,
                    child: Image.asset(
                      widget.product.imagePath,
                      height: 350,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Material(
                      color: lightGreenColor,
                      clipBehavior: Clip.antiAlias,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              //Code
                              const Text(
                                '#1521',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              // Name
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Price
                              Text(
                                '\$${widget.product.price}',
                                style: const TextStyle(
                                  color: bgColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Delivery
                              const Text(
                                'Delivery in 30 minutes',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Quantity: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Add to Cart
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: bgColor,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TabPills extends StatelessWidget {
  const _TabPills({
    Key? key,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(999),
      color: isActive ? lightGreenColor : Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
