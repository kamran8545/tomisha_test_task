import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/app_colors.dart';

class RegistrationButton extends StatelessWidget {
  final Function(VisibilityInfo) visibilityCallback;
  const RegistrationButton({super.key, required this.visibilityCallback});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return VisibilityDetector(
      key: Key('reg-button'),
      onVisibilityChanged: visibilityCallback,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: isTablet ? 280.w : 320.w,
          height: 40.h,
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(colors: [AppColors.textColor, AppColors.gradientEndColor]),
          ),
          child: Text(
            'Kostenlos Registrieren',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: AppColors.agreementBGColor),
          ),
        ),
      ),
    );
  }
}
