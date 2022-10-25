import 'package:flutter/material.dart';
import 'package:star_buck_animation/data/products.dart';
import 'package:star_buck_animation/models/starbuck_product.dart';

class HomeService {
  // Left and Right Cards Y Axis Max Translation
  final productCardYMaxTranslation = 50.0;

  // wehther the app is showing a product detail view
  final isShowingProductDetail = ValueNotifier(false);
  int _detailProductIndex = -1;

  int get detailProductIndex => _detailProductIndex;

  // store the current showing product card index
  final pageViewCurrentIndex = ValueNotifier(0);

  final pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );

  // storing the scroll offset of the page view
  final scrollOffsetNotifier = ValueNotifier<double>(0.0);

  List<StarBuckProduct> get products => starBucksProducts;



  HomeService() {
    pageController.addListener(listenToPageController);
  }

  // whenever there is a change in the PageView,
  // update the scrollOffset
  void listenToPageController() {
    scrollOffsetNotifier.value = pageController.page!;
  }

  void onPageChanged(int index) {
    pageViewCurrentIndex.value = index;
  }

  void onProductCardTap(int index) {
    isShowingProductDetail.value = true;
    _detailProductIndex = index;
  }
}
