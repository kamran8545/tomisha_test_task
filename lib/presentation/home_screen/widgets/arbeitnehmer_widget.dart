import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

class ArbeitnehmerWidget extends StatelessWidget {
  const ArbeitnehmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveBreakpoints.of(context).isMobile || ResponsiveBreakpoints.of(context).isPhone;
        final isTablet = ResponsiveBreakpoints.of(context).isTablet;

        return isMobile ? _MobileWidget() : _DesktopWidget(isTablet: isTablet);
      },
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final bool isTablet;

  const _DesktopWidget({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 50.w : 0.w),
          child: Stack(
            children: [
              Container(
                width: 208.w,
                height: 208.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.noBGColor, //.withAlpha(125),
                  borderRadius: BorderRadius.circular(208.r),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 50.w),
                  Text(
                    '1. ',
                    style: TextStyle(
                      fontSize: isTablet ? 100.sp : 130.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight2Color,
                      height: 1,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Erstellen dein Lebenslauf',
                      style: TextStyle(
                        fontSize: isTablet ? 24.sp : 30.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLight2Color,
                      ),
                    ),
                  ),
                  SizedBox(width: isTablet ? 0 : 62.w),
                  AppIcons.profileDataSVG,
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 100.h),
        Container(
          color: AppColors.agreementBGColor,
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: isTablet ? 50.w : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: isTablet ? 280.w : 324.w, height: isTablet ? 280.h : 327.h, child: AppIcons.taskSVG),
              SizedBox(width: isTablet ? 50 : 122.w),
              Text(
                '2. ',
                style: TextStyle(
                  fontSize: isTablet ? 100.sp : 130.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textLight2Color,
                  height: 1,
                ),
              ),
              Flexible(
                child: Text(
                  'Erstellen dein Lebenslauf',
                  style: TextStyle(
                    fontSize: isTablet ? 24.sp : 30.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textLight2Color,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 100.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 208.w,
                  height: 208.h,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: AppColors.noBGColor, //.withAlpha(125),
                    borderRadius: BorderRadius.circular(208.r),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 60.w),
                    Text(
                      '3. ',
                      style: TextStyle(
                        fontSize: isTablet ? 100.sp : 130.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLight2Color,
                        height: 1,
                      ),
                    ),
                    Text(
                      'Mit nur einem Klick\nbewerben',
                      style: TextStyle(
                        fontSize: isTablet ? 24.sp : 30.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLight2Color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: isTablet ? 0 : 62.w),
            SizedBox(width: isTablet ? 280.w : 502.w, height: isTablet ? 250 : 375.h, child: AppIcons.personalFileSVG),
          ],
        ),
        SizedBox(height: 200.h),
      ],
    );
  }
}

class _MobileWidget extends StatelessWidget {
  const _MobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcons.profileDataSVG,
        SizedBox(
          height: 208.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: -50.w,
                child: Container(
                  width: 208.w,
                  height: 208.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50.w),
                  decoration: BoxDecoration(
                    color: AppColors.noBGColor, //.withAlpha(125),
                    borderRadius: BorderRadius.circular(208.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1. ',
                        style: TextStyle(
                          fontSize: 130.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textLight2Color,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 50.h,
                left: 120.w,
                child: Text(
                  'Erstellen dein Lebenslauf',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          color: AppColors.agreementBGColor,
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                      fontSize: 130.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight2Color,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      'Erstellen dein Lebenslauf',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(width: 181.w, height: 127.h, child: AppIcons.taskSVG),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 304.h,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: -60.w,
                child: Container(
                  width: 304.w,
                  height: 304.h,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 90.w),
                  decoration: BoxDecoration(
                    color: AppColors.noBGColor, //.withAlpha(125),
                    borderRadius: BorderRadius.circular(208.r),
                  ),
                  child: Text(
                    '3. ',
                    style: TextStyle(
                      fontSize: 130.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight2Color,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 180.w,
                top: 40.h,
                child: SizedBox(
                  width: 275.w,
                  child: Text(
                    'Mit nur einem Klick bewerben',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(width: 281.w, height: 210.h, child: AppIcons.personalFileSVG),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 200.h),
      ],
    );
  }
}
