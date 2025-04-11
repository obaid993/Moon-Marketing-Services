import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';
import 'package:moon_marketing_services/app/profile/controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  ProfileScreen({Key? key}) : super(key: key);

  final GetStorage getStorage = GetStorage();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0, // Remove app bar shadow for a cleaner look
      ),
      body: Center(
        child: controller.profileModel.value != null
            ? SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4), // Subtle shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Picture Section
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.2),
                            child: (controller.profileModel.value.image != null &&
                                    controller.profileModel.value.image != "")
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.network(
                                      controller.profileModel.value.image ?? "",
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: AppColors.primaryColor,
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Spacing

                      // Profile Details Section
                      Column(
                        children: [
                          _buildProfileDetailRow(
                            icon: Icons.person,
                            label: "Name",
                            value: controller.profileModel.value.fullName ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.person,
                            label: "Father/Husband Name",
                            value: controller.profileModel.value.fatherName ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.phone,
                            label: "Phone No",
                            value:
                                controller.profileModel.value.customerMobile ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.phone,
                            label: "WhatsApp",
                            value: controller.profileModel.value.whatsapno ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.email,
                            label: "Email",
                            value:
                                controller.profileModel.value.customerEmail ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.person,
                            label: "User Name",
                            value: controller.profileModel.value.username ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildProfileDetailRow(
                            icon: Icons.home,
                            label: "Address",
                            value:
                                controller.profileModel.value.customerAddress ??
                                    "",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }

  // Helper Widget for Profile Detail Rows
  Widget _buildProfileDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 16), // Spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4), // Spacing
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}