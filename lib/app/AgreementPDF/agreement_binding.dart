import 'package:get/get.dart';
import 'package:moon_marketing_services/app/AgreementPDF/agreement_controller.dart';

class AgreementPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AgreementPdfController>(AgreementPdfController());
  }
}
