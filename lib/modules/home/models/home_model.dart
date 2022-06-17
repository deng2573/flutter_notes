class HomeModel {
  int id;
  String? title;
  String? desc;

  HomeModel({
    required this.id,
    this.title,
    this.desc,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['id'] as int,
        title: json['title'] as String?,
        desc: json['desc'] as String?);
  }
}
