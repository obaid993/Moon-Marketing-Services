import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moon_marketing_services/app/Register_Page/Model/registation_model.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:http/http.dart' as http;

class RegisterScreenController extends GetxController {

  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  RxString imagePath = "".obs;

  final GetStorage registerationStorage = GetStorage();

  RxBool isLoading = false.obs;

  // for password visibility
  var isPasswordVisible = false.obs;
  changeVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // for gender controller
  var selectedGender = "".obs;
  onChangedGender(dynamic gender) {
    selectedGender.value = gender;
  }

  Future<RegistrationModel> getRegistrationApi() async {
    final byte = await File(imagePath.value).readAsBytes();
    isLoading.value = true;

    final url =
        '${SEP.BASE_URL}${SEP.REGISTER}firstname=${firstNameController.value.text}&lastname=${lastNameController.value.text}&phone=${phoneController.value.text}&address=${addressController.value.text}&email=${emailController.value.text}&password=${passwordController.value.text}';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          "image": base64Encode(byte),
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["response"]["status"] == "ok") {
        // final LoginModel postData = LoginModel.fromJson(data);
        isLoading.value = false;
        return RegistrationModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        isLoading.value = false;
        throw Exception(data["response"]["message"]);
      }
    } else {
      isLoading.value = false;
      throw Exception('Registration Failed.');
    }
  }

  // ////////////////////////////////// Get Image ////////////////////////////
  Future getImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      update();
    } else {}
  }
}
