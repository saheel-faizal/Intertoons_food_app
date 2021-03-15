

class FoodDataClass {
  FoodDataClass({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory FoodDataClass.fromJson(Map<String, dynamic> json) => FoodDataClass(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.products,
    this.total,
  });

  List<Product> products;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
  };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.image,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.isVeg,
    this.variations,
  });

  int id;
  String sku;
  String name;
  String description;
  String image;
  String price;
  dynamic specialPrice;
  Available availableFrom;
  Available availableTo;
  String isVeg;
  List<Variation> variations;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    description: json["description"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"],
    specialPrice: json["special_price"],
    availableFrom: availableValues.map[json["available_from"]],
    availableTo: availableValues.map[json["available_to"]],
    isVeg: json["is_veg"],
    variations: json["variations"] == null ? null : List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "description": description,
    "image": image == null ? null : image,
    "price": price,
    "special_price": specialPrice,
    "available_from": availableValues.reverse[availableFrom],
    "available_to": availableValues.reverse[availableTo],
    "is_veg": isVeg,
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

enum Available { THE_0453, THE_1200, THE_0300 }

final availableValues = EnumValues({
  "03:00": Available.THE_0300,
  "04:53": Available.THE_0453,
  "12:00": Available.THE_1200
});

class Variation {
  Variation({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
  });

  int id;
  String title;
  String price;
  String specialPrice;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    specialPrice: json["special_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "special_price": specialPrice,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
