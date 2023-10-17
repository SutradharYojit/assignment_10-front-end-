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
    data['id'] = this.id;
    data['timeStamp'] = this.timeStamp;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['title'] = this.title;
    data['category'] = this.category;
    data['brand'] = this.brand;
    return data;
  }
}
