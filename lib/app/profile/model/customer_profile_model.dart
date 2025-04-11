class CustomerProfileModel {
  String? userId;
  String? fullName;
  String? userEmail;
  String? username;
  String? image;
  String? customerAddress;
  String? fatherName;
  String? customerMobile;
  String? customerEmail;
  String? whatsapno;

  CustomerProfileModel(
      {this.userId,
      this.fullName,
      this.userEmail,
      this.username,
      this.image,
      this.customerAddress,
      this.fatherName,
      this.customerMobile,
      this.customerEmail,
      this.whatsapno});

  CustomerProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['user_name'];
    userEmail = json['user_email'];
    username = json['username'];
    image = json['image'];
    customerAddress = json['customer_address'];
    fatherName = json['father_name'];
    customerMobile = json['customer_mobile'];
    customerEmail = json['customer_email'];
    whatsapno = json['whatsapno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = fullName;
    data['user_email'] = userEmail;
    data['username'] = username;
    data['image'] = image;
    data['customer_address'] = customerAddress;
    data['father_name'] = fatherName;
    data['customer_mobile'] = customerMobile;
    data['customer_email'] = customerEmail;
    data['whatsapno'] = whatsapno;
    return data;
  }
}
