import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/view/customer_plot_view.dart';
import 'package:moon_marketing_services/app/HomePage/view/homepage.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/view/payment_plan_pdf_view.dart';
import 'package:moon_marketing_services/app/profile/view/profile_screen.dart';

class HomePageController extends GetxController {
  ////////////////////   for bottom navigation bar ///////////
  late PageController bottomNavigationBarController;
  RxInt index = 0.obs;
  // late String _title;
  GlobalKey bottomNavigationKey = GlobalKey();
  final screens = [
    HomePage(),
    CustomerPlotScreen(),
    PaymentPalnPdfScreen(),
    ProfileScreen(),
  ];

  final List<String> appBarTitles = [
    "Home",
    "Plot Details",
    "Payment Plan",
    "Profile"
  ];

  // changeTabIndex(int index) {
  //   this.index.value = index;
  //   index = index;
  //     switch(index) {
  //      case 0: { _title = 'Home'; }
  //      break;
  //      case 1: { _title = 'Plot Details'; }
  //      break;
  //      case 2: { _title = 'Payment Plan'; }
  //      break;
  //      case 3: { _title = 'Profile'; }
  //      break;
  //     }
  // }

  @override
  void onClose() {
    bottomNavigationBarController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    bottomNavigationBarController = PageController();
    super.onInit();
  }
}
