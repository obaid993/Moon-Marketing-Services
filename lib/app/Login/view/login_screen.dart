// ignore_for_file: use_super_parameters, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/Login/controller/login_controller.dart';
import 'package:moon_marketing_services/page_and_routes/app_pages.dart';

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({Key? key}) : super(key: key);
  // final loginController = Get.put(LoginScreenController());
  final cincRegex = RegExp(r'^\d{5}-\d{7}-\d$');
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
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                Container(
                  width: Get.width,
                  height: Get.height * .45,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      )),
                  child: Container(
                    child: const Image(
                      image: AssetImage("assets/images/moon.png"),
                      height: 180,
                      width: 180,

                      //color: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      _buildTextFormField(
                        context: context,
                        name: "xxxxx-xxxxxxx-x",
                        keyboard: TextInputType.number,
                        isPassword: false,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.primaryColor,
                        ),
                        onChanged: (value) {
                          final formattedValue = _formatCNIC(value);
                          if (controller.userNameController.value.text !=
                              formattedValue) {
                            controller.userNameController.value.value =
                                controller.userNameController.value.value
                                    .copyWith(
                              text: formattedValue,
                              selection: TextSelection.collapsed(
                                offset: formattedValue.length,
                              ),
                            );
                          }
                        },
                        suffixIcon: null,
                        controller: controller.userNameController.value,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please provide a valid CNIC.";
                          } else if (!cincRegex.hasMatch(value!)) {
                            return "CNIC must follow the XXXXX-XXXXXXX-X format!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => _buildTextFormField(
                          context: context,
                          name: "password",
                          keyboard: TextInputType.text,
                          isPassword: !controller.isPasswordVisible.value,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color : AppColors.primaryColor
                            // color: AppColors.backgroundColo0,
                          ),
                          controller: controller.passwordController.value,
                          suffixIcon: GestureDetector(
                            onTap: () => controller.changeVisible(),
                            child: SizedBox(
                              width: 30,
                              child: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .suffixIconColor,
                                // color : AppColors.primaryColor
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 4) {
                              return "The password must be at least four characters long.";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.CHANGEPASSWORD);
                              },
                              child: Text('Foget Password?',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )))),
                      const SizedBox(
                        height: 40,
                      ),

                      Obx(
                        () => Container(
                          width: Get.width / 2,
                          height: Get.height / 18,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              maximumSize: const Size(double.infinity, 40),
                              minimumSize: const Size(double.infinity, 40),
                              disabledBackgroundColor:
                                  AppColors.backgroundColor,
                            ),
                            onPressed: !controller.isLoading.value
                                ? () async {
                                    controller.loginFormKey.currentState!
                                        .validate();

                                    try {
                                      await controller.loginApi();
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          icon: Icon(Icons.done,
                                          color: Colors.white
                                          ),
                                          message: "Success",
                                          messageText: Text(
                                            "Login Successfully",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          duration: Duration(seconds: 3),
                                          padding: EdgeInsets.all(12),
                                          margin: EdgeInsets.all(12),
                                          backgroundColor: AppColors.primaryColor,
                                          snackPosition: SnackPosition.TOP,
                                          snackStyle: SnackStyle.GROUNDED,
                                        ),
                                      );
                                      Get.offAllNamed(Routes.HOMEPAGE);
                                    } catch (e) {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          icon: Icon(Icons.error,
                                              color: Colors.white),
                                          message: "Error",
                                          messageText: Text(
                                            "Incorrect CINC Number or Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                          //e
                                          // .toString()
                                          // .replaceAll("Exception: ", "Incorrect Email or Password",), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                                          duration: Duration(seconds: 3),
                                          padding: EdgeInsets.all(12),
                                          margin: EdgeInsets.all(12),
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          snackPosition: SnackPosition.TOP,
                                          snackStyle: SnackStyle.GROUNDED,
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            child: controller.isLoading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : const Text("SIGN IN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 4,
                      ),
                      // Forgot Password Button
                      // InkWell(
                      //   onTap: () {
                      //     print("forgot Password");
                      //   },
                      //   child: const Align(
                      //     alignment: Alignment.centerRight,
                      //     child: Text(
                      //       "Forgot Password?",
                      //       style: TextStyle(
                      //           color: Colors.blue,
                      //           decoration: TextDecoration.underline),
                      //     ),
                      //   ),
                      // ),

                      // SizedBox(height: 20),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor: AppColors.backgroundColor,
                      //       minimumSize: Size.fromHeight(40)),
                      //   child: Text("Sign Up"),
                      //   onPressed: () {
                      //     Get.offAllNamed(Routes.REGISTER);
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 6,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 07),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //
                      //         },
                      //         child: Text(
                      //           "forgot password",
                      //           style: TextStyle(
                      //             color: Colors.blue,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// TextformField
Container _buildTextFormField({
  required BuildContext context,
  String? name,
  TextInputType? keyboard,
  bool? isPassword,
  Icon? prefixIcon,
  Widget? suffixIcon,
  Function(String)? onChanged,
  final String? Function(String?)? validator,
  TextEditingController? controller,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    width: Get.width,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: onChanged,
      validator: validator,
      // (value) {
      //   if (value == null || value.isEmpty || value.length < 3) {
      //     return "Please Provide Required field";
      //   } else {
      //     return null;
      //   }
      //  },
      obscureText: isPassword ?? false,
      controller: controller,
      keyboardType: keyboard,

      cursorColor: AppColors.primaryColor,
      cursorWidth: 2,

      style: const TextStyle(
        fontSize: 17,
      ),
      onSaved: (value) {
        // controller.getStorage.write(name, value);
      },
      decoration: InputDecoration(
        hintText: name,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    ),
  );
}

// ValidEmail(String Value) {
//   if (!GetUtils.isEmail(Value)) {
//     return "Provide Valid Email";
//   }
//   return null;
// }

// ValidPassword(String Value) {
//   if (Value.length < 6) {
//     return "The Password must be six character";
//   }
//   return null;
// }
