import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tomisha_test_task/presentation/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Deine Job',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
          ),
          home: HomeScreen(),
          builder: (BuildContext context, Widget? child) {
            return ResponsiveBreakpoints(
              breakpoints: const [
                Breakpoint(start: 0, end: 600, name: MOBILE),
                Breakpoint(start: 601, end: 1200, name: TABLET),
                Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
              ],
              child: child!,
            );
          },
        );
      },
    );
  }
}
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = ResponsiveBreakpoints.of(context).isPhone;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: [_HeaderSection(isMobile: isMobile), _StepsSection(isMobile: isMobile)]),
//       ),
//     );
//   }
// }
//
//
// class _StepsSection extends StatelessWidget {
//   final bool isMobile;
//
//   const _StepsSection({required this.isMobile});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(20.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Tabs
//           Wrap(
//             spacing: 8.w,
//             runSpacing: 8.h,
//             alignment: WrapAlignment.center,
//             children: [_tabChip('Arbeitnehmer', true), _tabChip('Arbeitgeber', false), _tabChip('Temporärbüro', false)],
//           ),
//           SizedBox(height: 20.h),
//           Text(
//             'Drei einfache Schritte\nzu deinem neuen Job',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: isMobile ? 20.sp : 28.sp, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 30.h),
//
//           // Steps
//           _stepItem(1, 'Erstellen dein Lebenslauf', 'assets/step1.png'),
//           _stepItem(2, 'Erstellen dein Lebenslauf', 'assets/step2.png'),
//         ],
//       ),
//     );
//   }
//
//   Widget _tabChip(String label, bool selected) {
//     return Chip(label: Text(label), backgroundColor: selected ? Colors.greenAccent : Colors.grey[300]);
//   }
//
//   Widget _stepItem(int number, String text, String imagePath) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 20.h),
//       child: Column(
//         children: [
//           Text('$number.', style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
//           Text(text, style: TextStyle(fontSize: 18.sp)),
//           SizedBox(height: 10.h),
//           Image.asset(imagePath, height: 200.h),
//         ],
//       ),
//     );
//   }
// }
