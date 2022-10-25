import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../assets/assets.gen.dart';
import '../constants/constants.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: lightGreenColor,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Assets.image1.image(),
              ),
              const SizedBox(width: 8),
              const Text(
                'Hisham',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
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
    );
  }
}
