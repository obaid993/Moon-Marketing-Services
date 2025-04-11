// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Change%20Password/changepassword_controller.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/custom_widgets/fonts.dart';

class ChangePassword extends GetView<ChangePasswordController> {
  const ChangePassword({Key? key}) : super(key: key);

  String _formatCNIC(String value) {
    final cleanValue = value.replaceAll('-', '');
    if (cleanValue.length <= 5) {
      return cleanValue;
    } else if (cleanValue.length <= 12) {
      return '${cleanValue.substring(0, 5)}-${cleanValue.substring(5)}';
    } else {
      return '${cleanValue.substring(0, 5)}-${cleanValue.substring(5, 12)}-${cleanValue.substring(12)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height : 5),
                      Image.asset(
                        "assets/images/moon.png",
                        width: 165,
                        height: 165,
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        "set your new password",
                        style: TextStyle(
                            fontFamily: bold,
                            fontSize: 14,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customText(
                text: 'CINC',
              ),
              const SizedBox(
                height: 5,
              ),
              customTextField(
                controller: controller.usernameController.value,
                hintText: "xxxxx-xxxxxxx-x",
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final formattedValue = _formatCNIC(value);
                  if (controller.usernameController.value.text !=
                      formattedValue) {
                    controller.usernameController.value.value =
                        controller.usernameController.value.value.copyWith(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                        offset: formattedValue.length,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              customText(text: "old Password"),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => customTextField(
                  controller: controller.oldPasswordController.value,
                  hintText: "old password",
                  keyboardType: TextInputType.text,
                  obscureText: !controller.isOldPasswordVisiable.value,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.changeVisible(PasswordType.oldPass);
                    },
                    child: SizedBox(
                      width: 30,
                      child: Icon(
                        controller.isOldPasswordVisiable.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              customText(text: "New Password"),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => customTextField(
                  controller: controller.newPasswordController.value,
                  hintText: "new password",
                  keyboardType: TextInputType.text,
                  obscureText: !controller.isNewPasswordVisiable.value,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.changeVisible(PasswordType.newPass);
                    },
                    child: SizedBox(
                      width: 30,

                      // controller: controller.newPasswordController.value,
                      // hintText: "new password",
                      // keyboardType: TextInputType.text,
                      // obscureText: !controller.isNewPasswordVisiable.value,
                      // suffixIcon: GestureDetector(
                      //   onTap: () {
                      //     controller.changeVisible(PasswordType.newPass);
                      //     print("New Password");
                      //   },
                      child: SizedBox(
                        width: 30,
                        child: Icon(
                          controller.isNewPasswordVisiable.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    // child: Icon(
                    //   controller.isNewPasswordVisiable.value
                    //       ? Icons.visibility
                    //       : Icons.visibility_off,
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      maximumSize: const Size(double.infinity, 45),
                      minimumSize: const Size(double.infinity, 45),
                      disabledBackgroundColor: AppColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () async {
                    await controller.changePassword();

                    controller.dispose();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color : Colors.white),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Row customText({required String text}) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: bold),
        ),
      )
    ]);
  }

  Column customTextField(
      {required final TextEditingController controller,
      required String hintText,
      required TextInputType keyboardType,
      // int? maxLength,
      // int? maxLines,
      Widget? suffixIcon,
      bool? validateLength = false,
      bool obscureText = false,
      Function(String)? onChanged,
      // ignore: non_constant_identifier_names
      final String Function(String?)? Validator}

      // String text,
      ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 12, top: 12),
        //   child: Text(text,
        //       style:
        //           const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            // maxLength: maxLength,
            // maxLines: maxLines,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  // fontFamily: regular,
                  // color: fontGrey,
                  ),
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
            ),
            validator: Validator ??
                (value) {
                  if (value!.isEmpty) {
                    return "The Field is required";
                  } else if (value.length < 4) {
                    return "password atleast four character";
                  } else {
                    return null;
                  }
                },
            onSaved: (newValue) {},
          ),
        ),
      ],
    );
  }
}
