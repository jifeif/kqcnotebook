
class SingleCoastRecord {
  String type;
  String price;
  String introduce;

  SingleCoastRecord(this.type, this.price, this.introduce);

  factory SingleCoastRecord.fromJson(Map map) => SingleCoastRecord(map["type"], map["price"], map["introduce"]);

  Map<String, dynamic> toJson() => {
    "type":this.type,
    "price":this.price,
    "introduce":this.introduce
  };
}
