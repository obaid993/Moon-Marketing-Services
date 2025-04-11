// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/models/customer_plot_model.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';
// import 'package:moon_marketing_services/app/Customer%20Plot%20Details/models/installment_report_model.dart';

import '../models/installment_report.dart'; // Import the new model

class CustomerPlotController extends GetxController {
  final GetStorage getStorage = GetStorage();
  CustomerPlotDetails? customerPlotDetails;

  @override
  onInit() async {
    super.onInit();
    await plotDetailsApi();
  }

  // Fetch plot details
  Future<List<CustomerPlotDetails>> plotDetailsApi() async {
    List<CustomerPlotDetails> plotList = [];
    print("Fetching plot details...");

    // Check internet connection
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw const SocketException("No Internet Connection");
    }

    // Fetch customer profile from storage
    final CustomerProfileModel customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));
    final url = SEP.BASE_URL + SEP.customerPlot + customerProfileModel.userId!;

    // Make API call
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["response"]["status"] == "ok") {
        final detailsList = (data["response"]["Company"]);

        // Parse plot details and add to list
        for (var plot in detailsList) {
          final plotDetails = CustomerPlotDetails.fromJson(plot);
          plotList.addIf(!plotList.contains(plotDetails), plotDetails);
        }

        return plotList;
      } else {
        throw Exception("Something Went Wrong");
      }
    } else {
      throw Exception("Failed to Load Plot Details");
    }
  }

  // // Fetch installment report for a specific plot
  // Future<List<InstallmentReport>> fetchInstallmentReport(String plotId) async {
  //   print("Fetching installment report for plot ID: $plotId");

  //   // Check internet connection
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     throw const SocketException("No Internet Connection");
  //   }

  //   // Make API call
  //   final url = "https://moon.tristarsmarketing.com/plot_installment_report_api/?plot_id=$plotId";
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = jsonDecode(response.body);

  //     // Parse installment data and return as a list of InstallmentReport objects
  //     return data.map((json) => InstallmentReport.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to Load Installment Report");
  //   }
  // }
  Future<InstallmentReport> fetchInstallmentReport(String plotId) async {
  final url = "https://moon.tristarsmarketing.com/plot_installment_report_api/?plot_id=$plotId";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    // Check if the list is not empty
    if (data.isNotEmpty) {
      // Return the first record
      return InstallmentReport.fromJson(data.first);
    } else {
      throw Exception("No installment data found for plot ID: $plotId");
    }
  } else {
    throw Exception("Failed to load installment report");
  }
}

//   Future<List<InstallmentReport>> fetchInstallmentReport(String plotId) async {
//   final url = "https://moon.tristarsmarketing.com/plot_installment_report_api/?plot_id=$plotId";

//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);

//     // Convert JSON data to InstallmentReport objects
//     return data.map((json) => InstallmentReport.fromJson(json)).toList();
//   } else {
//     throw Exception("Failed to load installment report");
//   }
// }
}