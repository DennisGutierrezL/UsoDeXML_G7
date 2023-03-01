import 'dart:core';

class Planta {
  String _commom, _botanical, _zone, _light, _price, _availability, _image;

  Planta(this._commom, this._botanical, this._zone, this._light, this._price,
      this._availability, this._image);

  static Planta? fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return Planta(json["COMMON"], json["BOTANICAL"], json["ZONE"],
          json["LIGHT"], json["PRICE"], json["AVAILABILITY"], json["image"]);
    }
  }

  get commom => this._commom;
  get botanical => this._botanical;
  get zone => this._zone;
  get light => this._light;
  get price => this._price;
  get availability => this._availability;
  get image => this._image;
}
