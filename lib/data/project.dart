class Project {
  String? name;
  String? clickUrl;
  String? imageUrl;
  String? description;

  Project({this.name, this.clickUrl, this.imageUrl, this.description});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json['name'],
        clickUrl: json['clickUrl'],
        imageUrl: json['imageUrl'],
        description: json['description'],
      );
}
