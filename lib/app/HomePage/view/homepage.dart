import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/view/customer_plot_view.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/payment_plan_pdf_controller.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/view/payment_plan_pdf_view.dart';
import 'package:moon_marketing_services/app/HomePage/controller/homepage_controller.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_drawer.dart';
import 'package:moon_marketing_services/app/profile/view/profile_screen.dart';
import 'package:moon_marketing_services/page_and_routes/app_pages.dart';

import '../../custom_widgets/custom_colors.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});
  final GetStorage getStorage = GetStorage();

  final PaymentPlanPdfController payment = Get.put(PaymentPlanPdfController());

  @override
  //HomePageController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: const Text("TriStar Marketing And\n          Developers"),
          //   elevation: 0,
          //   toolbarHeight: 70,
          //   titleSpacing: 1,
          //   centerTitle: true,
          //   backgroundColor: AppColors.backgroundColor,
          // ),

          // actions: [
          //   ActionWidget(),
          // ],

          drawer: CustomDrawer(),
          body: Column(
            children: [
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Expanded(child: bottomsheet()),
            ],
          ),
          bottomNavigationBar: Obx(() => ConvexAppBar(
                  items: [
                    TabItem(icon: Icons.home, title: "Home"),
                    TabItem(icon: Icons.file_copy, title: "Plot Details"),
                    TabItem(icon: Icons.picture_as_pdf, title: "Payment Plan"),
                    TabItem(icon: Icons.person, title: "Profile"),
                  ],
                  backgroundColor: AppColors.primaryColor,
                  initialActiveIndex: controller.index.value,
                  onTap: (int position) {
                    controller.index.value = position;
                    controller.bottomNavigationBarController
                        .jumpToPage(position);
                  }))
          // bottomNavigationBar: Obx(
          //   () => FancyBottomNavigation(
          //     onTabChangedListener: (position) {
          //       controller.index.value = position;
          //       controller.bottomNavigationBarController.jumpToPage(position);
          //     },
          //     tabs: [
          //       TabData(iconData: Icons.home, title: "Home"),
          //       TabData(iconData: Icons.file_copy, title: "Plot Details"),
          //       TabData(
          //           iconData: Icons.picture_as_pdf_rounded,
          //           title: "Payment Plan"),
          //       TabData(iconData: Icons.person, title: "Profile")
          //     ],
          //     initialSelection: controller.index.value,

          //     key: controller.bottomNavigationKey,
          //   ),
          // ),
          ),
    );
  }

  PageView bottomsheet() {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      controller: controller.bottomNavigationBarController,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeScreen();
          // return Builder(builder: (context) {
          //   return Text("Home Screen");
          // });
          case 1:
            return Get.put(CustomerPlotScreen());
          //return CustomerPlotScreen();

          case 2:
            return PaymentPalnPdfScreen();
          case 3:
            return ProfileScreen();
          default:
            return const Text("Default Screen");
        }
      },
      onPageChanged: null,
    );
  }
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (item) => [
        PopupMenuItem(
            child: GestureDetector(
                onTap: () => exit(0), child: const Text("Exit"))),
        PopupMenuItem(
          child: const Text("About Us"),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const Text("Logout"),
          onTap: () {
            Get.to(Routes.LOGIN);
          },
        )
      ],
    );
  }
}


// class BootomNavigationBar extends StatelessWidget {
//    BootomNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//     BottomNavigationBar(
//       backgroundColor: AppColors.backgroundColor,
//       selectedItemColor: Colors.blue,
//       unselectedItemColor: Colors.white.withOpacity(0.5),
//       selectedFontSize: 15,
//       unselectedFontSize: 12,
//       currentIndex: 0,
//       onTap: (value) => null,
      
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", ),
//         BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: "My Files",),
//         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
//       ],);
//   }
// }


