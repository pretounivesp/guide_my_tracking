class Rota {
  String title;
  String photo;
  String description;
  int distance;

  Rota({this.title, this.photo, this.description, this.distance});

  Rota.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    photo = json['photo'];
    description = json['description'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['distance'] = this.distance;
    return data;
  }
}
