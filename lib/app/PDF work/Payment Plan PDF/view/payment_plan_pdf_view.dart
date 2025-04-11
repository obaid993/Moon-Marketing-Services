// ignore_for_file: avoid_print, use_super_parameters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/payment_plan_pdf_controller.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/model/payment_plan_pdf_model.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/view/get_account_details_view.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';

class PaymentPalnPdfScreen extends GetView<PaymentPlanPdfController> {
  PaymentPalnPdfScreen({Key? key}) : super(key: key);
  final GetStorage getStroage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text("Payments"),
    centerTitle: true,
    elevation: 0,
  ),
  body: FutureBuilder<List<PaymentPlanModel>>(
    future: controller.getPaymentPlanPdf(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        if (snapshot.error is SocketException) {
          return Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/images/noInternet.svg"),
                const Text(
                  "Opps! No Internet Connection",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.red, // Customize the color
                  ),
                  Text(
                    'No Data Available',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 2, 3, 82),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'No Data available yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Customize the color
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else if (snapshot.hasData) {
        final List<PaymentPlanModel> paymentPlanList = snapshot.data ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: ListView.builder(
            itemCount: paymentPlanList.length,
            itemBuilder: (context, index) {
              final pdfmodel = paymentPlanList[index];
              return GestureDetector(
                onTap: () {
                  print("on tap");
                  controller.paymentPlanModel = paymentPlanList[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountDetailsScreen(),
                    ),
                  );
                },
                child: Card(
                  elevation: 5, // Increased elevation for a more pronounced shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners for a modern look
                  ),
                  margin: const EdgeInsets.only(bottom: 16), // Added margin between cards
                  child: Container(
                    padding: const EdgeInsets.all(16), // Consistent padding
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.white], // Subtle gradient background
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15), // Match card border radius
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Plot Number Section
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.9), // Slightly transparent
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Plot No:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // White text for contrast
                                ),
                              ),
                              Text(
                                pdfmodel.plotNo.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16), // Increased spacing
                        // Customer Details Section
                        Row(
                          children: [
                            // Icon Section
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.1), // Subtle background
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              child: const Icon(
                                Icons.picture_as_pdf, // PDF icon
                                size: 40,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 16), // Spacing between icon and text
                            // Text Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pdfmodel.customerName.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87, // Darker text for better readability
                                    ),
                                  ),
                                  const SizedBox(height: 8), // Spacing
                                  Text(
                                    pdfmodel.cnic.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54, // Slightly lighter text
                                    ),
                                  ),
                                  const SizedBox(height: 8), // Spacing
                                  Text(
                                    pdfmodel.plotSize.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.fontGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }

      return const Center(child: Text("Something went wrong"));
    },
  ),
);
  }

// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pdfx/pdfx.dart';
// import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/payment_plan_pdf_controller.dart';
// import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
// import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';

// class PaymentPlanPdfScreen extends GetView<PaymentPlanPdfController> {
//   final GetStorage getStorage = GetStorage();

//   PaymentPlanPdfScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(

//         // ),
//         body: NestedScrollView(
//       headerSliverBuilder: (BuildContext Context, bool isScrolled) {
//         return [
//           SliverAppBar(
//             leading: TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   color: AppColors.whiteColor,
//                 )),
//             title: const Text("Payment Plan Form"),
//             centerTitle: true,
//             elevation: 0,
//             backgroundColor: AppColors.backgroundColor,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           )
//         ];
//       },
//       body: Center(
//         child: FutureBuilder<File>(
//           future: controller.downloadFile(SEP.BASE_URL + SEP.paymentPlanPdf),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final String localPath = snapshot.data!.path;
//               final pdfController = PdfController(
//                 document: PdfDocument.openFile(localPath),
//               );
//
//               // return PDFView(
//               //   filePath: localPath.path,
//               // );
//               return PdfView(controller: pdfController);
//               // return Text("data");
//             } else if (snapshot.hasError) {
//               return Center(child: Text(snapshot.error.toString()));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//           // body: localPath != null
//           //     ? PDFView(
//           //         filePath: localPath,
//           //       )
//           //     : Center(child: CircularProgressIndicator()),
//         ),
//       ),
//     ));
//   }
// }
}
