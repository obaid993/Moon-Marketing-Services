// ignore_for_file: use_super_parameters, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/controllers/coustomer_plot_details.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/models/customer_plot_model.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import "package:flutter_svg/flutter_svg.dart";

import '../models/installment_report.dart';

class CustomerPlotScreen extends GetView<CustomerPlotController> {
  CustomerPlotScreen({Key? key}) : super(key: key);

  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Plot Details"),
          centerTitle: true,
        ),
        // backgroundColor: Colors.grey[100],

        body: FutureBuilder<List<CustomerPlotDetails>>(
          future: controller.plotDetailsApi(),
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
                ));
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 50, color: Colors.black // Customize the color
                          ),
                      SizedBox(height: 10),
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
                );
                // return const Center(
                //   child: Text("Error Occured"),
                // );
              }
            } else if (snapshot.hasData) {
              final List<CustomerPlotDetails> custDetailsList =
                  snapshot.data ?? [];
              print("abc $custDetailsList");
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: ListView.builder(
                    itemCount: custDetailsList.length,
                    itemBuilder: ((context, index) {
                      final cusDetails = custDetailsList[index];
                      return Center(
                        child: Column(
                          children: [_cardOfPlotDetail(cusDetails, context)],
                        ),
                      );
                    })),
              );
            }
            return const Center(child: Text("No recod found"));
          },
        ));
    // drawer: CustomDrawer(),
  }

  GestureDetector _cardOfPlotDetail(
      CustomerPlotDetails cusDetails, BuildContext context) {
    return GestureDetector(
      onTap: () {
        stdout.write("some");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _plotDetails(cusDetails)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Card(
          elevation: 5, // Increased elevation for a more pronounced shadow
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), // Rounded corners for a modern look
          ),
          child: Container(
            padding: const EdgeInsets.all(16), // Consistent padding
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade50,
                  Colors.white
                ], // Subtle gradient background
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  BorderRadius.circular(15), // Match card border radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Plot Number Section
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor
                        .withOpacity(0.9), // Slightly transparent
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
                        cusDetails.plotNo.toString(),
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
                        color: AppColors.primaryColor
                            .withOpacity(0.1), // Subtle background
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Icon(
                        Icons.assignment, // Professional icon
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
                            cusDetails.customerName.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black87, // Darker text for better readability
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing
                          Text(
                            cusDetails.cnic.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54, // Slightly lighter text
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing
                          Text(
                            cusDetails.plotSize.toString(),
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
      ),
    );
  }
}

/// Card => List of plot details ////
//   GestureDetector _cardOfPlotDetail(
//       CustomerPlotDetails cusDetails, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Fluttertoast.showToast(msg: 'Plot Details'

//         // ),

//         stdout.write("some");
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => _plotDetails(cusDetails)));
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(top: 13),
//         child: Card(
//           elevation: 3,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
//           ),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   height: 40,
//                   width: 180,
//                   decoration: const BoxDecoration(
//                     color: AppColors.primaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(1.5, 1.5),
//                         blurRadius: 3,
//                         color: Colors.black38,
//                       ),
//                     ],
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           "Plot No:",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           cusDetails.plotNo.toString(),
//                           style: const TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
//                 child: IntrinsicHeight(
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/icons/fileicon.png",
//                         width: 50,
//                         height: 50,
//                         color: Theme.of(context).iconTheme.color,
//                       ),
//                       const VerticalDivider(
//                         width: 20,
//                         thickness: 2,
//                       ),
//                       const SizedBox(
//                         width: 13,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             cusDetails.customerName.toString(),
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             cusDetails.cnic.toString(),
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "${cusDetails.plotSize}",
//                             style: const TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.fontGrey,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// class PlotDetailsView extends StatelessWidget {
//   PlotDetailsView({
//     super.key,
//     required this.controller,
//     required this.plotDetails
//   });

//   final CustomerPlotController controller;
//   final CustomerPlotDetails plotDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(

//         backgroundColor: AppColors.backgroundColor,
//         title: Obx(
//           () {
//             return Text(controller.customerName.value);
//           },
//         ),
//         leading: TextButton(onPressed: (){
//           Navigator.pop(context);

//         }, child: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor,)
//         )),

//       body: Center(
//         child: FutureBuilder<List<CustomerPlotDetails>>(
//           future: controller.plotDetailsApi().then((value) {
//             controller.customerName.value =
//                 "${value.isNotEmpty ? value.first.customerName : "Plot Details"}";
//             return value;
//           }),
//           builder: (context, snapshot) {
//
//             switch (snapshot.connectionState) {
//               case ConnectionState.done:
//
//                 if (snapshot.hasData) {
//
//                   final List<CustomerPlotDetails> cusDetailssList =
//                       snapshot.data ?? [];
//
//
//                   if (cusDetailssList.isEmpty) {
//                     return const Center(child: Text("No Data Found"));
//                   } else {
//                     return ListView.builder(
//                       itemCount: cusDetailssList.length,
//                       itemBuilder: (context, index) {
//                         final cusDetails = cusDetailssList[index];

//                       },
//                     );
//                   }
//                 } else {
//                   return const Center(
//                     child: Text("No Data available"),
//                   );
//                 }
//               default:
//                 return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//      // drawer: CustomDrawer(),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////////

// _plotDetails(
//   CustomerPlotDetails cusDetails,
// ) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Color.fromARGB(255, 2, 3, 82),
//       // backgroundColor: AppColors.backgroundColor,
//       title: const Text("Your File"),
//     ),
//     body: SingleChildScrollView(
//       child: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             Card(
//               elevation: 3,
//               child: SizedBox(
//                 height: Get.height * 0.18,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const CircleAvatar(
//                         backgroundColor: Colors.black,
//                         maxRadius: 42,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           maxRadius: 41,
//                           child: Icon(
//                             Icons.person,
//                             size: 55,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Flexible(
//                               child: Text(
//                                 cusDetails.customerName ?? "Name",
//                                 maxLines: 2,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               // getStorage.read("cnic"),
//                               cusDetails.cnic ?? "Cinc",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 14),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Row(
//                               children: [
//                                 Flexible(
//                                   child: Text(
//                                     cusDetails.categoryName ?? "Catagory",
//                                     // "Residential  ",

//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   cusDetails.plotSize ?? "size",
//                                   //"7-marla",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                                 // CustomeText(text: " - marla")
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Card(
//               elevation: 2.5,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 0.5,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Form No",
//                           ),
//                           Text(
//                             //getStorage.read("formNo")
//                             cusDetails.formNo ?? "",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Plot No",
//                           ),
//                           Text(
//                             //getStorage.read("plotNo")

//                             cusDetails.plotNo ?? "",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Applicant Name",
//                           ),
//                           Text(cusDetails.customerName ?? ""),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Applicant CINC",
//                           ),
//                           Text(
//                             //getStorage.read("nomineesName"),
//                             cusDetails.cnic ?? "",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Mobile No",
//                           ),
//                           Text(cusDetails.mobileNo ?? ""),
//                         ],
//                       ),
//                     ),
//                     const Divider(thickness: 1),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Nominee name",
//                           ),
//                           Text(
//                             // getStorage.read("relationApplicant")
//                             cusDetails.nomineesName ?? "",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(thickness: 1),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Total Amount",
//                           ),
//                           Text(cusDetails.totalPayment ?? ""),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 13, left: 13, right: 13, bottom: 13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomeText(
//                             text: "Down Payment",
//                           ),
//                           Text(cusDetails.advancePayment ?? ""),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     ),
//   );
// }

////////////////////////////////////////////////////////////////////////////////////////////

_plotDetails(CustomerPlotDetails cusDetails) {
  final CustomerPlotController controller = Get.find<CustomerPlotController>();
  final Future<InstallmentReport> installmentFuture =
      controller.fetchInstallmentReport(cusDetails.plotNo ?? "50");

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 2, 3, 82),
      title: const Text("Your File"),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Existing UI for plot details
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 3,
                child: SizedBox(
                  height: Get.height * 0.18,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          maxRadius: 42,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 41,
                            child: Icon(
                              Icons.person,
                              size: 55,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  cusDetails.customerName ?? "Name",
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                // getStorage.read("cnic"),
                                cusDetails.cnic ?? "Cinc",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      cusDetails.categoryName ?? "Catagory",
                                      // "Residential  ",

                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    cusDetails.plotSize ?? "size",
                                    //"7-marla",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  // CustomeText(text: " - marla")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Card(
                elevation: 2.5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Form No",
                            ),
                            Text(
                              cusDetails.formNo ?? "",
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Plot No",
                            ),
                            Text(
                              cusDetails.plotNo ?? "",
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Applicant Name",
                            ),
                            Text(cusDetails.customerName ?? ""),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Applicant CINC",
                            ),
                            Text(
                              cusDetails.cnic ?? "",
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Mobile No",
                            ),
                            Text(cusDetails.mobileNo ?? ""),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Nominee name",
                            ),
                            Text(
                              cusDetails.nomineesName ?? "",
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Total Amount",
                            ),
                            Text(cusDetails.totalPayment ?? ""),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, left: 13, right: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomeText(
                              text: "Down Payment",
                            ),
                            Text(cusDetails.advancePayment ?? ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // New Section for Installment Information
              const SizedBox(height: 20),
              const Text(
                "Installment Report",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              FutureBuilder<InstallmentReport>(
                future: installmentFuture,
                // controller.fetchInstallmentReport(cusDetails.plotNo!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    // final List<InstallmentReport> installmentReports =
                    //     snapshot.data!;
                    final InstallmentReport report = snapshot.data!;

                    return Card(
                      elevation: 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 13, left: 13, right: 13, bottom: 13),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       CustomeText(
                            //         text: "PlotName",
                            //       ),
                            //       Text(
                            //         //getStorage.read("formNo")
                            //         report.plotname,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const Divider(
                              thickness: 1,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    text: "Date",
                                  ),
                                  Text(
                                    //getStorage.read("nomineesName"),
                                    report.date,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    text: "Details",
                                  ),
                                  Text(report.details),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    text: "${report.details}",
                                  ),
                                  Text(report.amount),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    text: "Total Payment",
                                  ),
                                  Text(report.totalPayment),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    text: "Advance Payment",
                                  ),
                                  Text(report.advancePayment),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("No installment data available."),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class CustomeText extends StatelessWidget {
  String text;

  CustomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
