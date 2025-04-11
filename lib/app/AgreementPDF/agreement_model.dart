// class AgreementPdfModel {
//   String? plotNo;
//   String? cnic;
//   String? customerName;
//   String? plotSize;
//   String? pdfLink;

//   AgreementPdfModel(
//       {this.plotNo, this.cnic, this.customerName, this.plotSize, this.pdfLink});

//   AgreementPdfModel.fromJson(Map<String, dynamic> json) {
//     plotNo = json['Plot_no'];
//     cnic = json['cnic'];
//     customerName = json['customer_name'];
//     plotSize = json['plot_size'];
//     pdfLink = json['pdf_link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Plot_no'] = this.plotNo;
//     data['cnic'] = this.cnic;
//     data['customer_name'] = this.customerName;
//     data['plot_size'] = this.plotSize;
//     data['pdf_link'] = this.pdfLink;
//     return data;
//   }
// }

class AgreementPdfModel {
  String? plotNo;
  String? cnic;
  String? customerName;
  String? plotSize;
  String? pdfLink;

  AgreementPdfModel(
      {this.plotNo, this.cnic, this.customerName, this.plotSize, this.pdfLink});

  AgreementPdfModel.fromJson(Map<String, dynamic> json) {
  
    plotNo = json['Plot_no'];
    cnic = json['cnic'];
    customerName = json['customer_name'];
    plotSize = json['plot_size'];
    pdfLink = json['pdf_link'];
	
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Plot_no'] = plotNo;
    data['cnic'] = cnic;
    data['customer_name'] = customerName;
    data['plot_size'] = plotSize;
    data['pdf_link'] = pdfLink;
    return data;
  }
}
