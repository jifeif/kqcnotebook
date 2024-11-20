class RecordTypeModel {
  String id = "";
  String name = "";
  String icon = "";
  List sub = [];

  RecordTypeModel(this.id, this.name, this.icon, this.sub);

  factory RecordTypeModel.fromJSON(Map<String, dynamic> map) => RecordTypeModel(
        map["id"],
        map["name"],
        map["icon"],
        map["sub"],
      );

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "name": this.name,
    "icon": this.icon,
    "sub": this.sub,
  };
}
