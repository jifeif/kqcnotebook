class AccountInfoModel {
  String name = "";
  String birthday = "1900-01-01";

  AccountInfoModel(this.name, this.birthday);

  factory AccountInfoModel.fromJson(Map map) {
    return AccountInfoModel(map["name"], map["birthday"],);
  }

  Map<String, dynamic> toJson() => {
    "name":this.name,
    "birthday":this.birthday,
  };
}