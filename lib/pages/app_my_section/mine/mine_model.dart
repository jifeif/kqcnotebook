class MineCommonServeModel {
  String name;
  String iconName;
  bool isValid;

  MineCommonServeModel(
    this.name,
    this.iconName,
    this.isValid,
  );

  factory MineCommonServeModel.fromJson(Map map) => MineCommonServeModel(
        map["name"],
        map["iconName"],
        map["isValid"],
      );

  Map<String, dynamic> toJson() => {
        "name": this.name,
        "iconName": this.iconName,
        "isValid": this.isValid,
      };
}