import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:star_buck_animation/assets/assets.gen.dart';
import 'package:star_buck_animation/dependency_injection/di.dart';
import 'package:star_buck_animation/widgets/products_carousel.dart';
// math package

import 'constants/constants.dart';
import 'services/home_service.dart';
import 'widgets/widgets.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = GetIt.I<HomeService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          TopHeader(),
          BackgroundCurveShape(
          ),
          ProductsCarousel(),
          CurveMenuOption(
            imagePath: Assets.image1.path,
            positionFromBottom: MediaQuery.of(context).size.height * 0.61,
            index: 0,
          ),
          CurveMenuOption(
            positionFromBottom: MediaQuery.of(context).size.height * 0.60,
            imagePath: Assets.image2.path,
            index: 1,
          ),
          CurveMenuOption(
            positionFromBottom: MediaQuery.of(context).size.height * 0.58,
            imagePath: Assets.image3.path,
            index: 2,
          ),
          CurveMenuOption(
            positionFromBottom: MediaQuery.of(context).size.height * 0.53,
            imagePath: Assets.image4.path,
            index: 3,
          ),
        ],
      ),
    );
  }
}

class CurveMenuOption extends StatelessWidget {
  CurveMenuOption({
    Key? key,
    required this.imagePath,
    required this.positionFromBottom,
    required this.index,
  }) : super(key: key);

  final String imagePath;
  final double positionFromBottom;
  final int index;
  final service = GetIt.I<HomeService>();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: positionFromBottom),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Positioned(
          bottom: value,
          left: 30 + (index * 90),
          child: child!,
        );
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: service.isShowingProductDetail.value
            ? const SizedBox.shrink()
            : CircleAvatar(
                radius: 30,
                backgroundColor: lightGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imagePath),
                ),
              ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFffffff);
    Path path = Path()
      ..relativeLineTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.6, size.width, size.height * 0.4)
      ..relativeLineTo(0, -size.height * 0.4)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
