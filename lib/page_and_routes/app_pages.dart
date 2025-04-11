// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:moon_marketing_services/app/About%20Screen/about_binding.dart';
import 'package:moon_marketing_services/app/About%20Screen/about_view.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_binding.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_view.dart';
import 'package:moon_marketing_services/app/Change%20Password/changepassord_binding.dart';
import 'package:moon_marketing_services/app/Change%20Password/changepassword_view.dart';
import 'package:moon_marketing_services/app/HomePage/binding/homepage_Binding.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen_binding.dart';

import 'package:moon_marketing_services/app/PDF%20work/Assign%20Plot%20PDF/binding/assign_plot_pdf.dart';
import 'package:moon_marketing_services/app/PDF%20work/Assign%20Plot%20PDF/view/assign_plot_pdf_screen.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/bindinng/customer_plot_binding.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/view/customer_plot_view.dart';
import 'package:moon_marketing_services/app/HomePage/view/homepage.dart';
import 'package:moon_marketing_services/app/Login/Bindings/login_binding.dart';
import 'package:moon_marketing_services/app/Login/view/login_screen.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/binding/get_account_details_binding.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/binding/payment_plan_pdf_binding.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/get_account_details.controller.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/view/get_account_details_view.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/view/payment_plan_pdf_view.dart';
import 'package:moon_marketing_services/app/Register_Page/binding/register_binding.dart';
import 'package:moon_marketing_services/app/Register_Page/view/register_page.dart';
import 'package:moon_marketing_services/app/profile/binding/profile_binding.dart';
import 'package:moon_marketing_services/app/profile/view/profile_screen.dart';
import 'package:moon_marketing_services/splash/binding/splash_screen_binding.dart';
import 'package:moon_marketing_services/splash/view/splash_screen.dart';
part 'routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Path.SPLASH,
        binding: SplashScreenBinding(),
        page: () => const SplashScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
      name: _Path.LOGIN,
      binding: LoginScreenBinding(),
      page: () => LoginScreen(),
    ),
    GetPage(
      name: _Path.REGISTER,
      binding: RegisterScreenBinding(),
      page: () => const RegisterScreen(),
    ),
    GetPage(
        name: _Path.HOMEPAGE,
        binding: HomePageBinding(),
        page: () => HomePage(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.PROFILE,
        binding: ProfileScreenBinding(),
        page: () => ProfileScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.CUSTOMERPLOT,
        binding: CustomerPlotBinding(),
        page: () => CustomerPlotScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.AGREEMENTPDF,
        binding: AgreementPdfBinding(),
        page: () => AgreementPDF(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.ASSIGNPLOTPDF,
        binding: AssignPlotPdfBinding(),
        page: () => AssignPlotPdfScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.PAYMENTPLANPDF,
        binding: PaymentPlanPdfBinding(),
        page: () => PaymentPalnPdfScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    // GetPage(
    //     name: _Path.ACCOUNT,
    //     binding: AccountDetailsBinding(),
    //     page: () => AccountDetailsScreen(),
    //     transition: Transition.rightToLeft,
    //     transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: _Path.HOMESCREEN,
      binding: HomeScreenBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
        name: _Path.ABOUTSCREEN,
        binding: AboutScreenBinding(),
        page: () => const AboutScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Path.CHANGEPASSWORD,
        binding: ChangePasswordBinding(),
        page: () => const ChangePassword(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)),
  ];
}
