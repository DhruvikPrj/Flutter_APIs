class Customers {
  String? sId;
  String? name;
  String? email;
  String? phone;
  bool? isGold;

  Customers({this.sId, this.name, this.email, this.phone, this.isGold});

  Customers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isGold = json['isGold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['isGold'] = this.isGold;
    return data;
  }
}
