// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'package:http/http.dart' as http;
// import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/get_account_detail_model.dart';
// import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/payment_plan_pdf_model.dart';
// import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
// import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

// class AccountDetailsControllers extends GetxController {
//   final GetStorage getStorage = GetStorage();

//   RxBool isLoading = true.obs;

//   Future<AccountDetailsModel> getAccountDetails() async {
//     isLoading(true); // Set loading state to true when starting the request.

//        final CustomerProfileModel customerProfileModel =
//         CustomerProfileModel.fromJson(getStorage.read("customeModel"));

//        final url =
//         "${SEP.BASE_URL}${SEP.accountDetails}?id=${customerProfileModel.userId!}";
//       print("URL is $url");

//       final respponse = await http.get(Uri.parse(url));
//       print("response $respponse");

//     return ;
//   }

// }

// ignore_for_file: unused_local_variable

// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/get_account_detail_model.dart';
// import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/payment_plan_pdf_model.dart';
// import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
// import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

// class AccountDetailsControllers extends GetxController {
//   final GetStorage getStorage = GetStorage();
//   RxBool isLoading = true.obs;

//   Future<AccountDetailsModel> getAccountDetails() async {
//     isLoading(true);

//     final CustomerProfileModel customerProfileModel =
//         CustomerProfileModel.fromJson(getStorage.read("customeModel"));

//     final PaymentPlanModel paymentPlanModel =
//         PaymentPlanModel.fromJson(getStorage.read("customeModel"));

//     final url =
//         "${SEP.BASE_URL}${SEP.accountDetails}?id=${customerProfileModel.userId!}";
//     print("URL is $url");

//     final response = await http.get(Uri.parse(url));
//     print("response $response");

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print("abc $data");
//       if (data['response']['status'] == 'ok') {
//         final accountDetailsdata = AccountDetailsModel.fromJson(data);
//         print("xyz $accountDetailsdata");

//         isLoading(false);
//         return accountDetailsdata;
//       } else {
//         print("Error Message: ${data['response']['message']}");
//         throw Exception('Failed to fetch account details');
//       }
//     } else {
//       throw Exception('Failed to fetch account details');
//     }
//   }
// }
