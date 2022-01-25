import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/galery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  DateTime createdAt;
  DateTime updatedAt;
  List<GaleryModel> galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GaleryModel>((gallery) => GaleryModel.fromJson(gallery))
        .toList();

    createdAt = DateTime.parse(json['created_at'].toString().substring(0, 10) +
        ' ' +
        json['created_at'].toString().substring(11, 23));
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'].toString().substring(0, 10) +
            ' ' +
            json['updated_at'].toString().substring(11, 23));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
