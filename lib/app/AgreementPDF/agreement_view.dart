// ignore_for_file: use_super_parameters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_controller.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_model.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/custom_widgets/pdf_view_widget.dart';

class AgreementPDF extends GetView<AgreementPdfController> {
  AgreementPDF({Key? key}) : super(key: key);
  final GetStorage getStroage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text("Agreement Form"),
    centerTitle: true,
    elevation: 0, // Remove app bar shadow for a cleaner look
  ),
  body: FutureBuilder<List<AgreementPdfModel>>(
    future: controller.getAgreementPdf(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor, // Customize progress indicator color
          ),
        );
      } else if (snapshot.hasError) {
        if (snapshot.error is SocketException) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/noInternet.svg",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Opps! No Internet Connection",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 50,
                  color: AppColors.primaryColor, // Customize error icon color
                ),
                const SizedBox(height: 10),
                const Text(
                  'No Data Available',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'No Data available yet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600, // Customize text color
                  ),
                ),
              ],
            ),
          );
        }
      } else if (snapshot.hasData) {
        final List<AgreementPdfModel> agreementList = snapshot.data ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView.builder(
            itemCount: agreementList.length,
            itemBuilder: (context, index) {
              final pdfmodel = agreementList[index];
              return Card(
                elevation: 6, // Increased elevation for a floating effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                margin: const EdgeInsets.only(bottom: 16), // Spacing between cards
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade50, Colors.white], // Subtle gradient
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
                          color: AppColors.primaryColor.withOpacity(0.9), // Semi-transparent
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1.5, 1.5),
                              blurRadius: 3,
                              color: Colors.black.withOpacity(0.2), // Subtle shadow
                            ),
                          ],
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
                      const SizedBox(height: 16), // Spacing
                      // Customer Details Section
                      Row(
                        children: [
                          // Icon Section
                          Container(
                            padding: const EdgeInsets.all(12),
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
                          const SizedBox(width: 16), // Spacing
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
                                    color: Colors.black87, // Darker text for readability
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
                      const SizedBox(height: 16), // Spacing
                      // View PDF Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.primaryColor, Colors.blue.shade700], // Gradient button
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(1.5, 1.5),
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.2), // Subtle shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewWidget(
                                    path: pdfmodel.pdfLink ?? "",
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "View PDF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }

      return const Center(
        child: Text(
          "Something went wrong",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      );
    },
  ),
);
  
  }
}



//       body: FutureBuilder<File>(
//         future: controller.downloadFile(SEP.BASE_URL + SEP.agreementPdf),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final String localPath = snapshot.data!.path;
//             final PdfController pdfController = PdfController(
//               document: PdfDocument.openFile(localPath),
//             );
//             
//             // return PDFView(
//             //   filePath: localPath.path,
//             // );
//             return PdfView(controller: pdfController);
//             // return Text("data");
//           } else if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//         // body: localPath != null
//         //     ? PDFView(
//         //         filePath: localPath,
//         //       )
//         //     : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
