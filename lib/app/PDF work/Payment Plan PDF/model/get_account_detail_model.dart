// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class AccountDetailsModel {
  String? customerName;
  String? customerMobile;
  String? formNo;
  String? plotNo;
  String? plotSize;
  String? grandTotalAmount;
  String? payTotalAmount;
  int? dueAmount;
  List<ShortageData>? shortageData;

  AccountDetailsModel(
      {this.customerName,
      this.customerMobile,
      this.formNo,
      this.plotNo,
      this.plotSize,
      this.grandTotalAmount,
      this.payTotalAmount,
      this.dueAmount,
      this.shortageData});

  AccountDetailsModel.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    formNo = json['form_no'];
    plotNo = json['plot_no'];
    plotSize = json['plot_size'];
    grandTotalAmount = json['Grand_total_amount'];
    payTotalAmount = json['pay_total_amount'];
    dueAmount = json['due_amount'];
    if (json['shortage_data'] != null) {
      shortageData = <ShortageData>[];
      json['shortage_data'].forEach((v) {
        shortageData!.add(new ShortageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['customer_mobile'] = this.customerMobile;
    data['form_no'] = this.formNo;
    data['plot_no'] = this.plotNo;
    data['plot_size'] = this.plotSize;
    data['Grand_total_amount'] = this.grandTotalAmount;
    data['pay_total_amount'] = this.payTotalAmount;
    data['due_amount'] = this.dueAmount;
    if (this.shortageData != null) {
      data['shortage_data'] =
          this.shortageData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShortageData {
  String? plotId;
  String? customerName;
  String? dealer;
  String? year;
  String? month;
  String? amount;
  String? fullAmountShortage;

  ShortageData(
      {this.plotId,
      this.customerName,
      this.dealer,
      this.year,
      this.month,
      this.amount,
      this.fullAmountShortage});

  ShortageData.fromJson(Map<String, dynamic> json) {
    plotId = json['plot_id'];
    customerName = json['customer_name'];
    dealer = json['Dealer'];
    year = json['year'];
    month = json['month'];
    amount = json['amount'];
    fullAmountShortage = json['full_amount_shortage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plot_id'] = this.plotId;
    data['customer_name'] = this.customerName;
    data['Dealer'] = this.dealer;
    data['year'] = this.year;
    data['month'] = this.month;
    data['amount'] = this.amount;
    data['full_amount_shortage'] = this.fullAmountShortage;
    return data;
  }
}
