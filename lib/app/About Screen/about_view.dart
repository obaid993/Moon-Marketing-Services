import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/About%20Screen/about_controller.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/custom_widgets/fonts.dart';
import 'package:moon_marketing_services/app/custom_widgets/open_Whatsup.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends GetView<AboutScreenController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            children: [
              Image.asset(
                "assets/images/moon.png",
                height: 150,
                width: 150,
              ),
              const Text(
                "Moon ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    fontFamily: bold),
              ),
              const Text(
                "Marketing Services",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: bold),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                  'Founded on August 01, 2022 (formerly known as Moon Marketing Services.)'
                  'Moon Marketing Services operates in the field of real estate business, residential, and commercials.\n'
                  'With the slogan "Breaking time, through space" with a sustainable development strategy,'
                  ' taking Real Estate as a focus area, Tri Stars Marketing is constantly connecting buyers'
                  'and sellers in the field. Real estate, bringing people closer together, over the distance of'
                  'time and space, is a reliable place for real estate investment - an area that is constantly'
                  ' evolving over time.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: regular, fontSize: 15)),

              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Contact",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
              const SizedBox(
                height: 6,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Phone:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("03139643516",
                    style: TextStyle(fontFamily: semibold, fontSize: 14)),
              ),
              const SizedBox(
                height: 3,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("managementstarmarketing@gmail.com",
                    style: TextStyle(fontFamily: semibold, fontSize: 14)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Address:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const Text(
                  "Golden Gate Plaza Near Faisal Colony BRT Stop GT Road Peshawar.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: semibold, fontSize: 14)),

              const SizedBox(
                height: 25,
              ),
              const Text("Develped By",
                  style: TextStyle(
                      fontFamily: bold,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              const SizedBox(
                height: 5,
              ),
              const Text("KhyberCoded \nSoftware, Game & Research Lab",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: semibold, fontSize: 15)),
              TextButton(
                  onPressed: () {
                    urlOpen();
                  },
                  child: const Text(
                    "www.khyberCoded.com",
                    style: TextStyle(fontFamily: regular, color: Colors.blue),
                  ))
              // TextButton(
              //     child: const Text("chat"),
              //     onPressed: () {
              //       print("Button");
              //     }),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        onPressed: () {
          openWhatsUp();
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  Future<void> urlOpen() async {
    const url = "https://khybercoded.com/";
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
