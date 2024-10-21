class AccountInfoModel {
  String name = "";
  String birthday = "1900-01-01";
  bool isUpdate = false;
  AccountInfoModel(this.name, this.birthday, this.isUpdate);

  factory AccountInfoModel.fromJson(Map map) {
    return AccountInfoModel(map["name"], map["birthday"], map["isUpdate"]);
  }

  Map<String, dynamic> toJson() => {
    "name":this.name,
    "birthday":this.birthday,
    "isUpdate":this.isUpdate,
  };
}