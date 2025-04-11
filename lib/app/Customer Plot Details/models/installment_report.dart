class InstallmentReport {
  final String plotname;
  final String date;
  final String details;
  final String amount;
  final String totalPayment;
  final String advancePayment;

  InstallmentReport({
    required this.plotname,
    required this.date,
    required this.details,
    required this.amount,
    required this.totalPayment,
    required this.advancePayment,
  });

  factory InstallmentReport.fromJson(Map<String, dynamic> json) {
    return InstallmentReport(
      plotname: json['plotname'],
      date: json['date'],
      details: json['details'],
      amount: json['amount'],
      totalPayment: json['total_payment'],
      advancePayment: json['advance_payment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plotname': plotname,
      'date': date,
      'details': details,
      'amount': amount,
      'total_payment': totalPayment,
      'advance_payment': advancePayment,
    };
  }
    @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallmentReport &&
        other.details == details; // Use "details" as the unique key
  }

  @override
  int get hashCode => details.hashCode; // Use "details" as the unique key

}