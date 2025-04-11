class AssignPlotPdfModel {
  String? plotNo;
  String? cnic;
  String? customerName;
  String? plotSize;
  String? pdfLink;

  AssignPlotPdfModel(
      {
        this.plotNo, this.cnic, this.customerName, this.plotSize, this.pdfLink
	  }
	  );

  AssignPlotPdfModel.fromJson(Map<String, dynamic> json) {
    plotNo = json['plot_no'];
    cnic = json['cnic'];
    customerName = json['customer_name'];
    plotSize = json['plot_size'];
    pdfLink = json['pdf_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plot_no'] = plotNo;
    data['cnic'] = cnic;
    data['customer_name'] = customerName;
    data['plot_size'] = plotSize;
    data['pdf_link'] = pdfLink;
    return data;
  }
}
