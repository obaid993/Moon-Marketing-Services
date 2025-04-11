// ignore_for_file: use_super_parameters

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/Register_Page/Controller/register_controller.dart';
import 'package:moon_marketing_services/app/custom_widgets/input_text_fields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moon_marketing_services/page_and_routes/app_pages.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.registrationFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        Obx(
                          () => CircleAvatar(
                            radius: 50,
                            backgroundImage: controller.imagePath.isNotEmpty
                                ? Image.file(
                                    File(controller.imagePath.value),
                                    // height: 100,
                                    fit: BoxFit.cover,
                                    // width: 100,
                                  ).image
                                : const AssetImage(
                                    "assets/images/Drawerimage.jpg"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            onPressed: () {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text("Select Image"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await controller.getImage(
                                                      ImageSource.camera);
                                                  Get.back();
                                                },
                                                icon: const Icon(
                                                    Icons.camera_alt),
                                              ),
                                              const Text("Camera"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await controller.getImage(
                                                      ImageSource.gallery);
                                                  Get.back();
                                                },
                                                icon: const Icon(Icons.image),
                                              ),
                                              const Text("Gallery"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.add_photo_alternate,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10, right: 10),
                        child: Column(
                          children: [
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const Text("Create your account"),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextFormField(
                              context: context,
                              name: "Enter First Name",
                              controller: controller.firstNameController.value,
                              label: "first_name",
                              keyboard: TextInputType.name,
                              isPassword: false,
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the field is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextFormField(
                              context: context,
                              controller: controller.lastNameController.value,
                              name: "Enter Last Name",
                              label: "last_name",
                              keyboard: TextInputType.name,
                              isPassword: false,
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the field is required ";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextFormField(
                                context: context,
                                controller: controller.phoneController.value,
                                name: "Enter Phone Number",
                                label: "Phone Number",
                                keyboard: TextInputType.number,
                                prefixIcon: const Icon(Icons.phone),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "the field is requored";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextFormField(
                                context: context,
                                controller: controller.addressController.value,
                                name: "Enter Your Address",
                                label: "Address",
                                keyboard: TextInputType.multiline,
                                // maxlines: 6,
                                prefixIcon: const Icon(Icons.home),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "the field is required";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Container(
                                height: 58,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BuildText(
                                      text: "Gender",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                              value: "Male",
                                              groupValue: controller
                                                  .selectedGender.value,
                                              onChanged: (value) {
                                                controller
                                                    .onChangedGender(value);
                                              }),
                                          const Text(
                                            "Male",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            value: "Female",
                                            groupValue:
                                                controller.selectedGender.value,
                                            onChanged: (value) {
                                              controller.onChangedGender(value);
                                            },
                                          ),
                                          const Text(
                                            "Female",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextFormField(
                              context: context,
                              controller: controller.emailController.value,
                              name: "enter valid email",
                              label: "email",
                              keyboard: TextInputType.emailAddress,
                              isPassword: false,
                              prefixIcon: const Icon(Icons.email),
                              suffixIcon: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the field is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => _buildTextFormField(
                                context: context,
                                controller: controller.passwordController.value,
                                name: "enter password",
                                label: "password",
                                keyboard: TextInputType.visiblePassword,
                                isPassword: !controller.isPasswordVisible.value,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                  onTap: () => controller.changeVisible(),
                                  child: SizedBox(
                                    width: 30,
                                    child: Icon(
                                      controller.isPasswordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return "The Password must be six character";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.backgroundColor,
                                minimumSize: const Size.fromHeight(40),
                              ),
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Sign Up"),
                              onPressed: () async {
                                controller.registrationFormKey.currentState!
                                    .validate();

                                try {
                                  await controller.getRegistrationApi();
                                  Get.showSnackbar(
                                    const GetSnackBar(
                                      icon: Icon(Icons.done),
                                      message: "Success",
                                      messageText:
                                          Text("Register Successfully"),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                  Get.offAllNamed(Routes.LOGIN);
                                } catch (e) {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      icon: const Icon(Icons.error),
                                      message: "Error",
                                      messageText: Text(e.toString().replaceAll(
                                          "Exception: ",
                                          "The Email is already registered")),
                                      duration: const Duration(seconds: 3),
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                }
                                // controller.CheckLogin();
                                //
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Aleardy have account? "),
                                InkWell(
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.offAllNamed(Routes.LOGIN);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Container _buildTextFormField({
  required BuildContext context,
  required TextEditingController controller,
  String? name,
  String? label,
  TextInputType? keyboard,
  bool? isPassword,
  Icon? prefixIcon,
  Widget? suffixIcon,
  final String? Function(String?)? validator,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    width: MediaQuery.of(context).size.width * .8,
    child: TextFormField(
      validator: validator,
      controller: controller,
      // (value) {
      //   if (value == null || value.isEmpty || value.length < 3) {
      //     return "Please Provide Required field";
      //   } else {
      //     return null;
      //   }
      //  },
      obscureText: isPassword ?? false,
      keyboardType: keyboard,
      cursorColor: Colors.blue,
      cursorWidth: 2,

      style: const TextStyle(
        fontSize: 17,
      ),
      onSaved: (value) {
        // controller.getStorage.write(name, value);
      },
      decoration: InputDecoration(
        label: Text(label?.replaceAll("_", " ").capitalize ?? ""),
        hintText: name,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
