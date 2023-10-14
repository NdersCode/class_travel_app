import 'package:class_travel_app/misc/colors.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width,
  });

  final bool? isResponsive;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'img/button-one.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
