// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:moon_marketing_services/app/PDF%20work/Assign%20Plot%20PDF/model/assign_plot_pdf_model.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

class AssignPlotPdfController extends GetxController {
  final GetStorage getStorage = GetStorage();
  // final pdf = pw.Document().obs;

  String? localPath;

  @override
  onInit() async {
    super.onInit();
    getStorage.write("pdf", "pdf");
  }

  static var httpClient = HttpClient();
// final List assignplotList = [];
//final List<AssignPlotPdfModel> assignPlotList = List<AssignPlotPdfModel>.from([].obs);

  Future<List<AssignPlotPdfModel>> getAssignPlot() async {
    List<AssignPlotPdfModel> assignPlotPdfList = [];

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw const SocketException("No Internet Connection");
    }

    final CustomerProfileModel customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));
    var url = SEP.BASE_URL + SEP.assignPlotPdf + customerProfileModel.userId!;
    print("resposnr assign $url");

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsnDecode = jsonDecode(response.body);

      if (jsnDecode["response"]["status"] == "ok") {
        final dataList = (jsnDecode["response"]["pdf_data"]);

        for (var plotList in dataList) {
          AssignPlotPdfModel model = AssignPlotPdfModel.fromJson(plotList);
          // assignPlotPdfList.add(AssignPlotPdfModel.fromJson(plotList));
          // model.pdfLink = response.bodyBytes.toString();
          model.pdfLink = plotList["pdf_link"];
          assignPlotPdfList.add(model);
        }

        //   var dir = await getApplicationDocumentsDirectory();
        // File file = new File("${dir.path}/data.pdf");
        // file.writeAsBytesSync(response.bodyBytes, flush: true);

        return assignPlotPdfList;
      } else if (jsnDecode["response"]["status"] == "error") {
        throw Exception("Something Went wrong");
      } else {
        final errorMessage = jsnDecode["response"]["message"];
        throw Exception(errorMessage);
      }
    } else {}
    return assignPlotPdfList;
  }

  // Future<List<File>> downloadFile(
  //   String url,
  // ) async {
  //   final CustomerProfileModel customerProfileModel =
  //       CustomerProfileModel.fromJson(getStorage.read("customeModel"));
  //   final apiResponse =
  //       await http.get(Uri.parse(url + customerProfileModel.userId!));
  //   final responseBody = json.decode(apiResponse.body);

  //
  //

  //   final String pdfLink = "";
  //   List pdfLinks = [];
  //   if (responseBody["response"]["status"] == "ok") {
  //     pdfLinks = responseBody["response"]["pdf_data"];
  //

  //     for(var data in pdfLinks){
  //       assignPlotList.add(AssignPlotPdfModel.fromJson(data));
  //     }
  //   } else {
  //     throw Exception("Faild to Load PDF");
  //   }
  //   List<File> files = [];
  //   for (var pdfLink in pdfLinks) {
  //     Completer<File> completer = Completer();
  //     final filename = pdfLink.substring(pdfLink.lastIndexOf("/") + 1);
  //     var request = await HttpClient().getUrl(Uri.parse(pdfLink));
  //     var response = await request.close();
  //     var bytes = await consolidateHttpClientResponseBytes(response);
  //     var dir = await getApplicationDocumentsDirectory();
  //
  //
  //     File file = File("${dir.path}/$filename");

  //     await file.writeAsBytes(bytes, flush: true);
  //     completer.complete(file);
  //     files.add(file);
  //
  //   }
  //
  //   // try {
  //   //   final filename = pdfLink.substring(pdfLink.lastIndexOf("/") + 1);
  //   //   var request = await HttpClient().getUrl(Uri.parse(pdfLink));
  //   //   var response = await request.close();
  //   //   var bytes = await consolidateHttpClientResponseBytes(response);
  //   //   var dir = await getApplicationDocumentsDirectory();
  //   //
  //   //
  //   //   File file = File("${dir.path}/$filename");

  //   //   await file.writeAsBytes(bytes, flush: true);
  //   //   completer.complete(file);
  //   //

  //   //   // for(var assignListPdf in assignplotList){
  //   //   //   assignplotList.add(assignListPdf);     }
  //   // } catch (e) {
  //   //   throw Exception('Error parsing asset file!');
  //   // }

  //   // return completer.future;
  //   return files;
  // }
}
