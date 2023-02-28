import 'dart:core';

class Comida {
  String _name, _price, _description, _calories, _image;

  Comida(
      this._name, this._price, this._description, this._calories, this._image);

  static Comida? fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return Comida(json["name"], json["price"], json["description"],
          json["calories"], json["image"]);
    }
  }

  get name => this._name;
  get price => this._price;
  get description => this._description;
  get calories => this._calories;
  get image => this._image;
}
