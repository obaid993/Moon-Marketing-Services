// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen_controller.dart';
import 'package:moon_marketing_services/app/custom_widgets/fonts.dart';
import 'package:moon_marketing_services/page_and_routes/app_pages.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_drawer.dart';

import '../custom_widgets/custom_colors.dart';
import 'model/home_type.dart';
import 'widget/home_card.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //     statusBarColor: Color.fromARGB(255, 2, 3, 82),
    //     //or set color with: Color(0xFF0000FF)
    //     statusBarIconBrightness: Brightness.light));
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40)
            ),
          ),
          child : const Text(
          "Moon Marketing Services",
          textAlign: TextAlign.center,
        ),
        ),
        toolbarHeight: 70,
        titleSpacing: 1,
        // backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body : ListView(
        padding : EdgeInsets.symmetric(
          horizontal : Get.width * .04, vertical : Get.height * .015
        ),
        children: HomeType.values.map((e)=> HomeCard(homeType : e)).toList(),
        ),
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      //   child: Column(
      //     children: [
      //       Image.asset(
      //         "assets/images/moon.png",
      //         width: 150,
      //         height: 150,
      //       ),
      //       const SizedBox(
      //         height: 25,
      //       ),
      //       GridView(
      //         shrinkWrap: true,
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10,
      //           mainAxisExtent: 130,
      //         ),
      //         children: [
      //           HomeScreenItems(
      //               title: "Plot Details",
      //               icon: Icons.description_outlined,
      //               onpressed: () {
      //                 Get.toNamed(Routes.CUSTOMERPLOT);
      //               }),
      //           HomeScreenItems(
      //               title: "Payment Plan",
      //               icon: Icons.event_note_outlined,
      //               onpressed: () {
      //                 Get.toNamed(Routes.PAYMENTPLANPDF);
      //               }),
      //           HomeScreenItems(
      //             title: "Agreement Form",
      //             onpressed: () {
      //               Get.toNamed(Routes.AGREEMENTPDF);
      //             },
      //             imagePath: "agreement1.png",
      //           ),
      //           HomeScreenItems(
      //               title: "Allotment Letter",
      //               imagePath: "agreement.png",
      //               onpressed: () {
      //                 Get.toNamed(
      //                   Routes.ASSIGNPLOTPDF,
      //                 );
      //               }),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor.withOpacity(0.2),
        onPressed: () {
          controller.openWhatsup();
        },
        child: const Icon(
          Icons.chat,
          color : Colors.white
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeScreenItems extends StatefulWidget {
//   final String title;
//   final IconData? icon;
//   final VoidCallback onpressed;
//   final String? imagePath;
//   const HomeScreenItems({
//     super.key,
//     required this.title,
//     this.icon,
//     required this.onpressed,
//     this.imagePath,
//   });

//   @override
//   State<HomeScreenItems> createState() => _HomeScreenItemsState();
// }

// // class _HomeScreenItemsState extends State<HomeScreenItems> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: GestureDetector(
//         onTap: widget.onpressed,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: _isHovered
//                   ? [Colors.blue.shade800, Colors.purple.shade600]
//                   : [Colors.blue.shade600, Colors.purple.shade400],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: _isHovered
//                 ? [
//                     BoxShadow(
//                       color: Colors.blue.withOpacity(0.6),
//                       blurRadius: 20,
//                       spreadRadius: 2,
//                       offset: const Offset(0, 10),
//                     ),
//                   ]
//                 : [
//                     BoxShadow(
//                       color: Colors.blue.withOpacity(0.3),
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Icon or Image with Gradient
//               if (widget.icon != null)
//                 ShaderMask(
//                   shaderCallback: (bounds) => LinearGradient(
//                     colors: [Colors.white, Colors.blue.shade100],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ).createShader(bounds),
//                   child: Icon(
//                     widget.icon,
//                     size: 50,
//                     color: Colors.white,
//                   ),
//                 )
//               else
//                 ShaderMask(
//                   shaderCallback: (bounds) => LinearGradient(
//                     colors: [Colors.white, Colors.blue.shade100],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ).createShader(bounds),
//                   child: Image.asset(
//                     "assets/images/${widget.imagePath}",
//                     width: 40,
//                     height: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//               const SizedBox(height: 15),
//               // Title with Gradient Text
//               ShaderMask(
//                 shaderCallback: (bounds) => LinearGradient(
//                   colors: [Colors.white, Colors.blue.shade100],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ).createShader(bounds),
//                 child: Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontFamily: 'semibold',
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // class HomeScreenItems extends StatelessWidget {
// //   final String title;
// //   final IconData? icon;
// //   final VoidCallback onpressed;
// //   final String? imagePath;
// //   const HomeScreenItems({
// //     super.key,
// //     required this.title,
// //     this.icon,
// //     required this.onpressed,
// //     this.imagePath,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onpressed,
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Theme.of(context).cardColor,
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             icon != null
// //                 ? Icon(
// //                     icon,
// //                     size: 40,
// //                     // color: AppColors.backgroundColor,
// //                   )
// //                 : Image.asset(
// //                     "assets/images/$imagePath",
// //                     width: 35,
// //                     height: 35,
// //                     color: Theme.of(context).iconTheme.color,
// //                   ),
// //             const SizedBox(
// //               height: 15,
// //             ),
// //             Text(
// //               title,
// //               style: const TextStyle(
// //                 fontFamily: semibold,
// //                 fontSize: 14,
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
