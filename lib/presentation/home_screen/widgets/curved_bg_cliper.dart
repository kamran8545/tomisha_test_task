
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CurvedBackground extends StatelessWidget {
  const CurvedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 440.h,
      child: ClipPath(
        clipper: BottomCurveClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(104 * 3.1416 / 180),
              colors: [
                AppColors.agreementBGColor,
                AppColors.mainGradientEndColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start top-left
    path.lineTo(0, 0);
    path.lineTo(0, size.height); // Left side down

    // Straight bottom line to 20% width
    path.lineTo(size.width * 0.2, size.height);

    // Curve from 20% to 100% width (right side)
    path.cubicTo(
      size.width * 0.5, size.height - 20, // Control point 1
      size.width * 0.8, size.height - 40, // Control point 2
      size.width, size.height - 50,             // End at bottom right
    );

    path.lineTo(size.width, 0); // Right side up
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}