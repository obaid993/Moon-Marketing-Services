import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/get_account_detail_model.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/payment_plan_pdf_model.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

import '../../../Customer Plot Details/models/installment_report.dart';

class PaymentPlanPdfController extends GetxController {
  final GetStorage getStorage = GetStorage();

  late final CustomerProfileModel customerProfileModel;
  late PaymentPlanModel paymentPlanModel;
  late AccountDetailsModel accountDetailsModel;

  @override
  onInit() async {
    super.onInit();
    customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));
    // getStorage.write("pdf", "pdf");
  }

  static var httpClient = HttpClient();

  Future<List<PaymentPlanModel>> getPaymentPlanPdf() async {
    List<PaymentPlanModel> paymentPlanList = [];

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw const SocketException("No Internet connection");
    }

    final CustomerProfileModel customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));

    final url =
        SEP.BASE_URL + SEP.paymentPlanPdf + customerProfileModel.userId!;
    final response = await http.get(Uri.parse(url));
    print("url $url");
    print("response of payment $response");

    if (response.statusCode == 200) {
      // ignore: non_constant_identifier_names
      final JsonDecode = jsonDecode(response.body);

      if (JsonDecode["response"]["status"] == "ok") {
        final data = (JsonDecode["response"]["pdf"]);

        for (var i in data) {
          PaymentPlanModel model = PaymentPlanModel.fromJson(i);
          model.pdfLink = i["pdf_link"];
          paymentPlanList.add(model);
        }

        return paymentPlanList;
      } else if (JsonDecode["response"]["status"] == "error") {
        throw Exception("Someting went wrong");
      } else {
        final errorMessage = JsonDecode["response"]["message"];
        throw Exception(errorMessage);
      }
    } else {}
    return paymentPlanList;
  }
  
  Future<List<InstallmentReport>> fetchInstallmentReport(String plotId) async {
  final url = "https://moon.tristarsmarketing.com/plot_installment_report_api/?plot_id=$plotId";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    // Convert JSON data to InstallmentReport objects
    return data.map((json) => InstallmentReport.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load installment report");
  }
}

  Future<AccountDetailsModel> getAccountDetails() async {
    final url =
        "${SEP.BASE_URL}${SEP.accountDetails}?id=${paymentPlanModel.plotId!}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // print("print data $data");

      if (data["response"]["status"] == "ok") {
        ///Assuming you have an AccountDetails model
        final accountDetails =
            AccountDetailsModel.fromJson(data['response']['data']);
        // print(" print 2 accountDetails ${accountDetails.toJson()}");
        // print(accountDetails);
        return accountDetails;
      } else {
        throw Exception(data["response"]["message"]);
      }
    } else {
      throw Exception("Failed to fetch account details");
    }
    //return getAccountDetails();
  }
}
