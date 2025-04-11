import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

class ProfileScreenController extends GetxController {
  final GetStorage getStorage = GetStorage();
  var profileModel = CustomerProfileModel().obs;
  // var isConnected = true.obs;

  @override
  void onInit() async {
    profileModel.value =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));
    super.onInit();
    // await checkConnectivity();
  }

  // Future<void> checkConnectivity() async{
  //   final connectivityResult = Connectivity().checkConnectivity();
  //   if(connectivityResult == await ConnectivityResult.none){
  //    isConnected.value = false;
  //   }
  //   else{
  //     isConnected.value= true;
  //   }
  // }
}
