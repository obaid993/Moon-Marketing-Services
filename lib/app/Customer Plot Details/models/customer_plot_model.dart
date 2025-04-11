class CustomerPlotDetails {
  String? customerName;
  String? customerMobile;
  String? formNo;
  String? plotNo;
  String? dealerName;
  String? nomineesName;
  String? relationApplicant;
  String? mobileNo;
  String? cnic;
  String? categoryName;
  String? plotSize;
  String? totalPayment;
  String? advancePayment;

  CustomerPlotDetails(
      {
	  this.customerName,
      this.customerMobile,
      this.formNo,
      this.plotNo,
      this.dealerName,
      this.nomineesName,
      this.relationApplicant,
      this.mobileNo,
      this.cnic,
      this.categoryName,
      this.plotSize,
      this.totalPayment,
      this.advancePayment});

  CustomerPlotDetails.fromJson(Map<dynamic, dynamic> json) {
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    formNo = json['form_no'];
    plotNo = json['plot_no'];
    dealerName = json['dealer_name'];
    nomineesName = json['nominees_name'];
    relationApplicant = json['relation_applicant'];
    mobileNo = json['mobile_no'];
    cnic = json['cnic'];
    categoryName = json['category_name'];
    plotSize = json['plot_size'];
    totalPayment = json['total_payment'];
    advancePayment = json['advance_payment'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['customer_name'] = customerName;
    data['customer_mobile'] = customerMobile;
    data['form_no'] = formNo;
    data['plot_no'] = plotNo;
    data['dealer_name'] = dealerName;
    data['nominees_name'] = nomineesName;
    data['relation_applicant'] = relationApplicant;
    data['mobile_no'] = mobileNo;
    data['cnic'] = cnic;
    data['category_name'] = categoryName;
    data['plot_size'] = plotSize;
    data['total_payment'] = totalPayment;
    data['advance_payment'] = advancePayment;
    return data;
  }

  @override
  bool operator ==(covariant CustomerPlotDetails other) {
    return plotNo == other.plotNo && formNo == other.formNo;
  }

  @override
  int get hashCode => formNo.hashCode ^ plotNo.hashCode;
}











// class CustomerPlotDetails {
//   String? customerName;
//   String? formNo;
//   String? plotNo;
//   String? dealerName;
//   String? nomineesName;
//   String? relationApplicant;
//   String? mobileNo;
//   String? cnic;

//   CustomerPlotDetails(
//       {this.customerName,
//       this.formNo,
//       this.plotNo,
//       this.dealerName,
//       this.nomineesName,
//       this.relationApplicant,
//       this.mobileNo,
//       this.cnic});

//   CustomerPlotDetails.fromJson(Map<String, dynamic> json) {
//     customerName = json['customer_name'];
//     formNo = json['form_no'];
//     plotNo = json['plot_no'];
//     dealerName = json['dealer_name'];
//     nomineesName = json['nominees_name'];
//     relationApplicant = json['relation_applicant'];
//     mobileNo = json['mobile_no'];
//     cnic = json['cnic'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['customer_name'] = this.customerName;
//     data['form_no'] = this.formNo;
//     data['plot_no'] = this.plotNo;
//     data['dealer_name'] = this.dealerName;
//     data['nominees_name'] = this.nomineesName;
//     data['relation_applicant'] = this.relationApplicant;
//     data['mobile_no'] = this.mobileNo;
//     data['cnic'] = this.cnic;
//     return data;
//   }
// }
