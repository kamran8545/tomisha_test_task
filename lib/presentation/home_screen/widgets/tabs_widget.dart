import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class TabsWidget extends StatelessWidget {
  final RxInt selectedIndex;
  const TabsWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (){
              selectedIndex.value = 0;
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric( horizontal: 32.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex.value == 0 ? AppColors.selectedTabColor : AppColors.whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), bottomLeft: Radius.circular(12.r)),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Text(
                'Arbeitnehmer',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: selectedIndex.value == 0 ? AppColors.agreementBGColor : AppColors.textColor),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              selectedIndex.value = 1;
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex.value == 1 ? AppColors.selectedTabColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(0.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Text(
                'Arbeitgeber',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: selectedIndex.value == 1 ? AppColors.agreementBGColor : AppColors.textColor),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              selectedIndex.value = 2;
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric( horizontal: 32.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex.value == 2 ? AppColors.selectedTabColor : AppColors.whiteColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Text(
                'Temporärbüro',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: selectedIndex.value == 2 ? AppColors.agreementBGColor : AppColors.textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
