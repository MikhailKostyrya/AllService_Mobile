class Category {
  final int id;
  final String categoryName;
  final String? photo;

  Category({
    required this.id,
    required this.categoryName,
    this.photo,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['category_name'],
      photo: json['photo'],
    );
  }
}
