class SEP {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://moon.tristarsmarketing.com/';
  static const String userLoginApi = 'user_login_api?'; // post api

  // ignore: constant_identifier_names
  static const String REGISTER =
      "user_registration_api?firstname=waris&lastname=khan&phone=usertest@gmail.com&address=icp&gender=male&email=waris@gmal.com&password=admin&user_type=1&status=1"; //Get Registration api

  static const String customerProfile = "customer_by_id_list?id=";

  static const String customerPlot = "customer_plot_list?id=";

  static const String agreementPdf = "pdfagreement?id="; // agreement pdf

  static const String assignPlotPdf =
      "assign_plot_pdf?id="; // assign plot pdf (alottment letter)

  static const String paymentPlanPdf =
      "payment_plan_pdf?id="; // payment plan pdf

  static const String accountDetails = "get_account_details_list";
  
  static const String plotPaymentInstallmentReportDetails = "plot_installment_report_api?plot_id=";

  static const String changePassword = "change_password_customer";
}
