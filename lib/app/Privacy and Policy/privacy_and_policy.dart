import 'package:flutter/material.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/custom_widgets/fonts.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({super.key});

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy And Policy"),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText("Introduction",
                fontFamily: bold, fontSize: 18, fontWeight: FontWeight.bold),
            const SizedBox(
              height: 6,
            ),
            customText(
              "Moon Marketing Services ('us,' 'we,' or 'our') is committed to protecting "
              " the privacy and security of your personal information. This Privacy Policy outlines how we"
              " collect, use, disclose, and safeguard your data when you use our mobile application,"
              "SMM (hereinafter referred to as 'the App'). By using the App, you consent to the practices"
              "described in this Privacy Policy.",
              fontFamily: semibold,
            ),
            const SizedBox(
              height: 12,
            ),
            customText(
              "Sharing Your Information",
              fontSize: 18,
              fontFamily: bold,
            ),
            const SizedBox(
              height: 5,
            ),
            customText("We may not share your information with third parties."),
            customText(
              "Changes to This Privacy Policy",
              fontSize: 18,
              fontFamily: bold,
            ),
            const SizedBox(
              height: 5,
            ),
            customText("We may update our Privacy Policy from time to time."
                'Thus, you are advised to review this page periodically for any changes. '
                ' We will notify you of any changes by posting the new Privacy Policy on this'
                ' page.'),
            const SizedBox(
              height: 10,
            ),
            customText(
              "Contact Us",
              fontSize: 18,
              fontFamily: bold,
            ),
            const SizedBox(
              height: 5,
            ),
            customText(
                "If you have any questions or suggestions about our Privacy Policy, do not hesitate to"
                "contact us at managementstarmarketing@gmail.com.")
          ],
        ),
      ),
    );
  }

  Text customText(
    String text, {
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
