
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

class ArbeitgeberWidget extends StatelessWidget {
  const ArbeitgeberWidget({super.key});

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
                      'Erstellen dein Unternehmensprofil',
                      softWrap: true,
                      style: TextStyle(fontSize: isTablet ? 24.sp :30.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                    ),
                  ),
                  SizedBox(width: isTablet ? 0 :62.w),
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
              SizedBox(width: 258.w, height: 179.h, child: AppIcons.aboutMeSVG),
              SizedBox(width:  isTablet ? 50 : 122.w),
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
                  'Erstellen ein Jobinserat',
                  style: TextStyle(fontSize: isTablet ? 24.sp : 30.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
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
                      'Wähle deinen\nneuen Mitarbeiter aus',
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
            SizedBox(width: isTablet ? 200.w : 240.w, height: isTablet ? 160.h : 197.h, child: AppIcons.swipeProfilesSVG),
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcons.profileDataSVG,
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 208.h,
          child: Stack(
            // alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: -50,
                child: Container(
                  width: 208.w,
                  height: 208.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 30.w),
                  decoration: BoxDecoration(
                    color: AppColors.noBGColor, //.withAlpha(125),
                    borderRadius: BorderRadius.circular(208.r),
                  ),
                  child: Text(
                    '1. ',
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
                bottom: 40.h,
                left: 120.w,
                child: Text(
                  'Erstellen dein Unternehmensprofil',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          height: 370.h,
          color: AppColors.agreementBGColor,
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Stack(
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
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(
                      'Erstellen ein Jobinserat',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                    ),
                  ),
                ],
              ),
              Positioned(top: 80.h, left: 100.w, child: SizedBox(width: 259.w, height: 179.h, child: AppIcons.aboutMeSVG)),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: -60.w,
                child: Container(
                  width: 304.w,
                  height: 304.h,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 50.w),
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
                    'Wähle deinen neuen Mitarbeiter aus',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textLight2Color),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 160.h),
                child: SizedBox(width: 281.w, height: 210.h, child: AppIcons.swipeProfilesSVG),
              ),
            ],
          ),
        ),

        SizedBox(height: 200.h),
      ],
    );
  }
}