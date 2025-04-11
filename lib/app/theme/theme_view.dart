import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/theme/theme_controller.dart';

class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Theme"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Default Theme"),
            onTap: () {
              themeController.isDarkMode.value = false;
              Get.back();
            },
          ),
          ListTile(
            title: const Text("Light Theme"),
            onTap: () {
              themeController.isDarkMode.value = false;
              Get.back();
            },
          ),
          ListTile(
            title: const Text("Dark Theme"),
            onTap: () {
              themeController.isDarkMode.value = true;
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
