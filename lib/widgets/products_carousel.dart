import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:star_buck_animation/product_detail.dart';
import 'package:star_buck_animation/widgets/background_curve.dart';
import '../services/home_service.dart';
import 'dart:math' as math;

import 'starbucks_card.dart';

class ProductsCarousel extends StatelessWidget {
  ProductsCarousel({super.key});
  final service = GetIt.I<HomeService>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: MediaQuery.of(context).size.height * 0.6),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          builder: (context, value, widget) {
            return SizedBox(
              height: value,
              // width: MediaQuery.of(context).size.width,
              child: PageView.custom(
                controller: service.pageController,
                onPageChanged: service.onPageChanged,
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ValueListenableBuilder(
                        valueListenable: service.scrollOffsetNotifier,
                        builder: (context, value, wwidget) {
                          return TweenAnimationBuilder(
                              curve: Curves.easeOut,
                              tween: Matrix4Tween(
                                begin: Matrix4.identity(),
                                end: Matrix4.identity()
                                  ..translate(0.0, getCardYTranslation(index))
                                  ..rotateZ(getCardRotation(index)),
                              ),
                              duration: const Duration(milliseconds: 200),
                              builder: (context, value, widget) {
                                return Transform(
                                  transform: value,
                                  child: StarBuckProductCard(
                                    isActive: true,
                                    isShowingProductDetail: service.isShowingProductDetail.value && service.pageViewCurrentIndex.value == index,
                                    product: service.products[index],
                                    onTap: () {
                                      // open a full page dialog with hero anim
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            final tween = Tween(begin: 0.0, end: 1.0);
                                            final offsetAnimation = animation.drive(tween);
                                            return FadeTransition(
                                              opacity: offsetAnimation,
                                              child: Stack(
                                                children: [
                                                  BackgroundCurveShape(
                                                    begin: 0.65,
                                                    end: 2.0,
                                                  ),
                                                  child,
                                                ],
                                              ),
                                            );
                                          },
                                          transitionDuration: const Duration(milliseconds: 500),
                                          pageBuilder: (context, animation, secondaryAnimation) {
                                            return ProductDetail(
                                              product: service.products[index],
                                            );
                                          },
                                        ),
                                      );
                                      // service.onProductCardTap(index);
                                    },
                                  ),
                                );
                              });
                        });
                  },
                  childCount: service.products.length,
                ),
              ),
            );
          }),
    );
  }

  double getCardYTranslation(index) {
    final pageScrollValue = (index - service.scrollOffsetNotifier.value).abs();
    if (pageScrollValue >= 0 || pageScrollValue <= 1.0) {
      return service.productCardYMaxTranslation * pageScrollValue;
    }
    return 0;
  }

  double getCardRotation(int index) {
    final pageScrollValue = (index - service.scrollOffsetNotifier.value);
    if (pageScrollValue.abs() >= 0 && pageScrollValue.abs() <= 1.0) {
      return (math.pi / 180) * (pageScrollValue * 5);
    }
    return 0;
  }
}
