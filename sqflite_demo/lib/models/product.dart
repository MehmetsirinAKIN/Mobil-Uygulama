class Product {
  int? id; // Opsiyonel id
  String name; // Nullable değil, mutlaka değer almalı
  String description; // Nullable değil, mutlaka değer almalı
  double unitPrice; // Nullable değil, mutlaka değer almalı

  // Ana Constructor
  Product(this.name, this.description, this.unitPrice);

  // withId Constructor
  Product.withId(this.id, this.name, this.description, this.unitPrice);

  // fromObject Constructor
  Product.fromObject(dynamic o)
      : id = int.tryParse(o["id"].toString()) ?? 0, // Null gelirse 0 ata
        name = o["name"] ?? "", // Null gelirse boş string ata
        description = o["description"] ?? "", // Null gelirse boş string ata
        unitPrice = double.tryParse(o["unitPrice"].toString()) ?? 0.0; // Null gelirse 0.0 ata

  // toMap Metodu
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
