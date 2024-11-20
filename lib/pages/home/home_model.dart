class SingleCoastRecord {
  String type;
  String price;
  String introduce;
  String iconName;
  String date;

  SingleCoastRecord(this.type, this.price, this.introduce, this.iconName, this.date);

  factory SingleCoastRecord.fromJson(Map map) => SingleCoastRecord(
        map["type"],
        map["price"],
        map["introduce"],
        map["iconName"],
        map["date"]
      );

  Map<String, dynamic> toJson() => {
        "type": this.type,
        "price": this.price,
        "introduce": this.introduce,
        "iconName": this.iconName,
        "date": this.date,
      };
}
