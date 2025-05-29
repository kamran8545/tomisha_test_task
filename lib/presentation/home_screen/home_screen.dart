import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/arbeitgeber_widget.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/arbeitnehmer_widget.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/curved_bg_cliper.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/registration_button.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/tabs_widget.dart';
import 'package:tomisha_test_task/presentation/home_screen/widgets/temporarburo_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxBool isRegBtnVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          final isMobile = ResponsiveBreakpoints.of(context).isMobile || ResponsiveBreakpoints.of(context).isPhone;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isMobile
                        ? _MobileWidget(visibilityCallback: onRegBtnVisibilityChange)
                        : _DesktopWidget(visibilityCallback: onRegBtnVisibilityChange),
                    SizedBox(height: 36.h),
                    TabsWidget(selectedIndex: selectedIndex),
                    SizedBox(height: 30.h),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: Text(
                          selectedIndex.value == 0
                              ? 'Drei einfache Schritte\nzu deinem neuen Job'
                              : selectedIndex.value == 1
                              ? 'Drei einfache Schritte zu deinem neuen Mitarbeiter'
                              : 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textLightColor,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h),
                    Obx(
                      () =>
                          selectedIndex.value == 0
                              ? ArbeitnehmerWidget()
                              : selectedIndex.value == 1
                              ? ArbeitgeberWidget()
                              : TemporarburoWidget(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 67.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [BoxShadow(color: AppColors.blackColor.withAlpha(60), blurRadius: 2, spreadRadius: 2)],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => Visibility(
                          visible: !isRegBtnVisible.value,
                          child: Text(
                            'Jetzt Klicken',
                            style: TextStyle(
                              color: AppColors.textLightColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Obx(
                        () => Visibility(
                          visible: !isRegBtnVisible.value,
                          child: Container(
                            height: 40.h,
                            width: 255.w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: AppColors.borderColor, width: 1.w),
                            ),
                            child: Text(
                              'Kostenlos Registrieren',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onRegBtnVisibilityChange(visibilityInfo) {
    double visiblePercentage = visibilityInfo.visibleFraction * 100;
    if (visiblePercentage == 0) {
      isRegBtnVisible.value = false;
    } else {
      isRegBtnVisible.value = true;
    }
  }
}

class _DesktopWidget extends StatelessWidget {
  final Function(VisibilityInfo) visibilityCallback;

  const _DesktopWidget({super.key, required this.visibilityCallback});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Stack(
      children: [
        const CurvedBackground(),
        Container(
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Deine Job\nwebsite',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 45.sp : 65.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  RegistrationButton(visibilityCallback: visibilityCallback),
                ],
              ),
              SizedBox(width: isTablet ? 50.w : 100.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(500.r),
                child: Container(
                  width: isTablet ? 240.w : 300.w,
                  height: isTablet ? 240.w : 300.h,
                  color: AppColors.whiteColor,
                  child: AppIcons.agreementSVG,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final Function(VisibilityInfo) visibilityCallback;

  const _MobileWidget({super.key, required this.visibilityCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.agreementBGColor,
      padding: EdgeInsets.only(top: 90.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Deine Job\nwebsite',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.w600, color: AppColors.textBlackColor),
          ),
          AppIcons.agreementSVG,
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            height: 80.h,
            padding: EdgeInsets.only(top: 30.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
            ),
            child: Center(child: RegistrationButton(visibilityCallback: visibilityCallback)),
          ),
        ],
      ),
    );
  }
}
