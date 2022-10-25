import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/home_service.dart';
import 'good_food_mood.dart';
import 'top_profile_nav_bar.dart';

class TopHeader extends StatelessWidget {
  TopHeader({
    Key? key,
  }) : super(key: key);

  final service = GetIt.I.get<HomeService>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: service.isShowingProductDetail.value ? SizedBox.fromSize() : SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopProfileBar(),
                SizedBox(height: 24),
                GoodFoodMood(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
