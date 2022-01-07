class CategoryModel {
  int id;
  String name;

  CategoryModel({
    this.id,
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // name = json['name'];
    id = json['id'] == null ? null : json['id'] as int;
    name = json['name'] == null ? null : json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
