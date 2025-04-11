// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_model.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

class AgreementPdfController extends GetxController {
  final GetStorage getStorage = GetStorage();

  @override
  onInit() async {
    super.onInit();
    getStorage.write("pdf", "pdf");
  }

  static var httpClient = HttpClient();

  Future<List<AgreementPdfModel>> getAgreementPdf() async {
    List<AgreementPdfModel> agreementPdfList = [];

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw const SocketException("No Internet Connection");
    }

    final CustomerProfileModel customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));

    final url = SEP.BASE_URL + SEP.agreementPdf + customerProfileModel.userId!;

    final response = await http.get(Uri.parse(url));
//

    if (response.statusCode == 200) {
      // ignore: non_constant_identifier_names
      final JsonDecode = jsonDecode(response.body);

      if (JsonDecode["response"]["status"] == "ok") {
        final data = (JsonDecode["response"]["pdf_data"]);
        //
        //

        for (var i in data) {
          AgreementPdfModel model = AgreementPdfModel.fromJson(i);
          model.pdfLink = i["pdf_link"];
          agreementPdfList.add(model);
        }

        return agreementPdfList;
      } else if (JsonDecode["response"]["status"] == "error") {
        throw Exception("Something Went wrong");
      } else {
        final errorMessage = JsonDecode["response"]["message"];
        throw Exception(errorMessage);
      }
    } else {}
    return agreementPdfList;
  }
}

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:http/http.dart' as http;
// import 'package:pdf/widgets.dart' as pw;
// import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

// class AgreementPdfController extends GetxController {
//   final GetStorage getStorage = GetStorage();
//   final pdf = pw.Document().obs;

//   String? localPath;

//   @override
//   onInit() async {
//     super.onInit();
//     getStorage.write("pdf", "pdf");
//   }

//   static var httpClient = HttpClient();
//   Future<File> downloadFile(
//     String url,
//   ) async {
//     final CustomerProfileModel customerProfileModel =
//         CustomerProfileModel.fromJson(getStorage.read("customeModel"));
//     final apiResponse =
//         await http.get(Uri.parse(url + customerProfileModel.userId!));
//     final responseBody = json.decode(apiResponse.body);
//     final String pdfLink;
//     if (responseBody["response"]["status"] == "ok") {
//       pdfLink = responseBody["response"]["pdf"];
//
//     } else {
//       throw Exception("Faild to Load PDF");
//     }
//     Completer<File> completer = Completer();
//
//     try {
//       final filename = pdfLink.substring(pdfLink.lastIndexOf("/") + 1);
//       var request = await HttpClient().getUrl(Uri.parse(pdfLink));
//       var response = await request.close();
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       var dir = await getApplicationDocumentsDirectory();
//
//
//       File file = File("${dir.path}/$filename");

//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   //    static Future<String> loadPDF() async {
//   //       final url = SEP.BASE_URL + SEP.AgreementPdf;
//   //   var response = await http.get(Uri.parse(url));

//   //   var dir = await getApplicationDocumentsDirectory();
//   //   File file = new File("${dir.path}/data.pdf");
//   //   file.writeAsBytesSync(response.bodyBytes, flush: true);
//   //   return file.path;
//   // }

//   //   try {
//   //     final response = await http.post(Uri.parse(url));

//   //     if (response.statusCode == 200) {
//   //       final data = jsonDecode(response.body);
//   //       if (data['response']['status'] == 'ok') {
//   //
//   //       } else {
//   //
//   //       }
//   //     }
//   //   } catch (e) {}
// }

// // void
// //
// //       document: pdf.value.save(),
// //       onLayout: (format) => pdf.value.save(),
// //     );
// //   }
