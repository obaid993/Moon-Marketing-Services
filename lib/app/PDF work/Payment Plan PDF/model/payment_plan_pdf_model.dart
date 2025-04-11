// class AccountDetails {
//   String? customerName;
//   String? customerMobile;
//   String? formNo;
//   String? plotNo;
//   String? plotSize;
//   String? grandTotalAmount;
//   int? payTotalAmount;
//   int? dueAmount;

//   AccountDetails(
//       {this.customerName,
//       this.customerMobile,
//       this.formNo,
//       this.plotNo,
//       this.plotSize,
//       this.grandTotalAmount,
//       this.payTotalAmount,
//       this.dueAmount});

//   AccountDetails.fromJson(Map<String, dynamic> json) {
//     customerName = json['customer_name'];
//     customerMobile = json['customer_mobile'];
//     formNo = json['form_no'];
//     plotNo = json['plot_no'];
//     plotSize = json['plot_size'];
//     grandTotalAmount = json['Grand_total_amount'];
//     payTotalAmount = json['pay_total_amount'];
//     dueAmount = json['due_amount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['customer_name'] = customerName;
//     data['customer_mobile'] = customerMobile;
//     data['form_no'] = formNo;
//     data['plot_no'] = plotNo;
//     data['plot_size'] = plotSize;
//     data['Grand_total_amount'] = grandTotalAmount;
//     data['pay_total_amount'] = payTotalAmount;
//     data['due_amount'] = dueAmount;
//     return data;
//   }
// }

class PaymentPlanModel {
  String? plotNo;
  String? plotId;
  String? cnic;
  String? customerName;
  String? plotSize;
  String? pdfLink;

  PaymentPlanModel(
      {this.plotNo,
      this.plotId,
      this.cnic,
      this.customerName,
      this.plotSize,
      this.pdfLink});

  PaymentPlanModel.fromJson(Map<String, dynamic> json) {
    plotNo = json['plot No '];
    plotId = json['plot id '];
    cnic = json['cnic'];
    customerName = json['customer_name'];
    plotSize = json['plot_size'];
    pdfLink = json['pdf_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plot No '] = plotNo;
    data['plot id '] = plotId;
    data['cnic'] = cnic;
    data['customer_name'] = customerName;
    data['plot_size'] = plotSize;
    data['pdf_link'] = pdfLink;
    return data;
  }
}


// class PaymentPlanModel {
//   String? plotNo;
//   String? cnic;
//   String? customerName;
//   int? plotSize;

//   String? pdfLink;

//   PaymentPlanModel(
//       {this.plotNo, this.cnic, this.customerName, this.plotSize, this.pdfLink});

//   PaymentPlanModel.fromJson(Map<String, dynamic> json) {
//     plotNo = json['plot No '];
//     cnic = json['cnic'];
//     customerName = json['customer_name'];
//     plotSize = json['plot_size'];
//     pdfLink = json['pdf_link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['plot No '] = plotNo;
//     data['cnic'] = cnic;
//     data['customer_name'] = customerName;
//     data['plot_size'] = plotSize;
//     data['pdf_link'] = pdfLink;
//     return data;
//   }
// }
