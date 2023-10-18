class ProductList {
  String? id;
  int? timeStamp;
  double? price;
  String? imageUrl;
  String? description;
  String? title;
  String? category;
  String? brand;

  ProductList(
      {this.id,
        this.timeStamp,
        this.price,
        this.imageUrl,
        this.description,
        this.title,
        this.category,
        this.brand});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeStamp = json['timeStamp'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    title = json['title'];
    category = json['category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['timeStamp'] = timeStamp;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['title'] = title;
    data['category'] = category;
    data['brand'] = brand;
    return data;
  }
}
