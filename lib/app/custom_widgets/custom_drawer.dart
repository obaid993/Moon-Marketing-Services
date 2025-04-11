import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';
import 'package:moon_marketing_services/app/theme/theme_controller.dart';
import 'package:moon_marketing_services/page_and_routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'custom_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final GetStorage getStorage = GetStorage();
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    CustomerProfileModel customerProfileModel =
        CustomerProfileModel.fromJson(getStorage.read("customeModel"));

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Drawer(
        // shadowColor: Colors.blue,
        backgroundColor: AppColors.primaryColor,
      
        width: Get.width * 0.7,
        // elevation: 4,
        //  backgroundColor: AppColors.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )),
      
        child: ListView(
          
          children: [
            //  SizedBox(
            //   height: 40,
            //  ),
            //  ListTile(
            //    leading : CircleAvatar(
            //      backgroundColor: AppColors.primaryColor0,
            //      radius: 50,
            //      backgroundImage: customerProfileModel.image != null &&
            //              customerProfileModel.image != ""
            //          ? Image.network(
            //              "${customerProfileModel.image}",
            //              errorBuilder: (context, error, stackTrace) {
            //                return const Text("Image Not Found");
            //              },
            //            ).image
            //          : Image.asset(
            //              "assets/images/logo.png",
            //              width: 50,
            //              height: 50,
            //            ).image,
            //    ),
            //    title: Text(
            //        customerProfileModel.fullName ?? "",
            //      ),
            //      subtitle: Text(
            //        customerProfileModel.userEmail ?? "",
            //      ),
            //  ),
      
      
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment : CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor0,
                  radius: 50,
                  backgroundImage: customerProfileModel.image != null &&
                          customerProfileModel.image != ""
                      ? Image.network(
                          "${customerProfileModel.image}",
                          errorBuilder: (context, error, stackTrace) {
                            return const Text("Image Not Found");
                          },
                        ).image
                      : Image.asset(
                          "assets/images/logo.png",
                          width: 50,
                          height: 50,
                        ).image,
                ),
                SizedBox(height : 9),
                Text(
                    customerProfileModel.fullName ?? "",
                    style : TextStyle(
                      fontSize : 16,
                      fontWeight : FontWeight.w500,
                      color : Colors.white
                    )
                  ),
                   Text(
                    customerProfileModel.userEmail ?? "",
                     style : TextStyle(
                      fontSize : 12,
                      color : Colors.white
                      // fontWeight : FontWeight.w500,
                    )
                  ),
                // ListTile(
                //   title: Text(
                //     customerProfileModel.fullName ?? "",
                //   ),
                //   subtitle: Text(
                //     customerProfileModel.userEmail ?? "",
                //   ),
                // )
              ],
            ),
      
            
            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.home),
            //     title: const Text("Home"),
            //     onTap: () {
            //       // Navigator.pop(context);
            //       final controller = Get.find<HomePageController>();
            //       controller.index.value = 0;
            //       controller.bottomNavigationBarController.jumpToPage(0);
            //       // Navigator.pushAndRemoveUntil(
            //       //   context,
            //       //   MaterialPageRoute(
            //       //     builder: (context) => HomePage(),
            //       //   ),
            //       //   (route) => true,
            //       // );
            //       // Get.toNamed(Routes.HOMEPAGE);
            //     },
            //   ),
            // ),
       Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: Colors.white,
          ),
            ListTile(
              leading: const Icon(Icons.info_outline,
              color : Colors.white,
              ),
              title: const Text("About",
              style : TextStyle(
                color : Colors.white
              )
              ),
              trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              onTap: () {
                Get.toNamed(
                  Routes.ABOUTSCREEN,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web,
              color : Colors.white
              ),
              title: const Text("Website",
              style : TextStyle(
                color : Colors.white
              )
              ),
              trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              onTap: () {
                openWebsite(context);
              },
            ),
            ListTile(
              leading: const Icon(
              Icons.password_rounded,
              color : Colors.white
              ),
              title: const Text("Change Password",
              style : TextStyle(
                color : Colors.white
              )
              ),
              trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              onTap: () {
                Get.toNamed(Routes.CHANGEPASSWORD);
              },
            ),
            ExpansionTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(
                Icons.mode,
                color : Colors.white
              ),
              title: const Text(
                "Select Theme",
                style : TextStyle(
                  color :Colors.white
                )
              ),
              children: [
                ListTile(
                  leading: const Icon(Icons.light_mode,
                  color : Colors.white
                  ),
                  title: const Text("Light Mode",
                  style : TextStyle(
                  color :Colors.white
                )
                  ),
                  onTap: () {
                    themeController.setThemeMode(ThemeMode.light);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mode_night,
                  color : Colors.white
                  ),
                  title: const Text("Dark mode",
                  style : TextStyle(
                  color :Colors.white
                )
                  ),
                  onTap: () {
                    themeController.setThemeMode(ThemeMode.dark);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.share,
              color : Colors.white
              ),
              title: const Text("Share",
              style : TextStyle(
                color : Colors.white
              ),
              ),
              trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              onTap: () {
                shareApp();
              },
            ),
      
            ListTile(
              leading: const Icon(Icons.lock,
              color : Colors.white
              ),
              title: const Text("Privacy Policy",
              style : TextStyle(
              color : Colors.white
            ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onTap: () {
                // Get.to(PrivacyAndPolicy());
                privacyAndPolicy(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined,
             color : Colors.white
              ),
              trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
              title: const Text("Logout",
               style : TextStyle(
              color : Colors.white
            ),
              ),
              onTap: () {
                getStorage.erase();
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
          ],
        ),
      ),
    );
  }

  void shareApp() {
    Share.share(
        // khyber coded paly store link
        "https://play.google.com/store/apps/dev?id=7816543509484557488");
  }

  openWebsite(BuildContext context) async {
    var webUrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.moon.tristarsmarketing.com/"));

    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return SafeArea(child: WebViewWidget(controller: webUrl));
    })));
  }

  // for privacy and ploicy
  privacyAndPolicy(BuildContext context) async {
    var webUrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse("https://www.moon.tristarsmarketing.com/privacy-policy"));

    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return SafeArea(child: WebViewWidget(controller: webUrl));
    })));
  }
}
