import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

import 'comida.dart';
import 'Planta.dart';
import 'receta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grupo 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Taller: Uso de XML'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Future<List<Comida>> getComidaFromXML(BuildContext context) async {
    final xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/comida.xml");
    print(xmlString);
    List<Comida> comida = [];
    var raw = xml.XmlDocument.parse(xmlString);
    var elements = raw.findAllElements("food");

    for (var item in elements) {
      comida.add(Comida(
          item.findElements("name").first.text,
          item.findElements("price").first.text,
          item.findElements("description").first.text,
          item.findElements("calories").first.text,
          item.findElements("image").first.text));
    }
    //print(comida);
    return comida;
  }

  Future<List<Planta>> getPlantaFromXML(BuildContext context) async {
    final xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/Planta.xml");
    print(xmlString);
    List<Planta> planta = [];
    var raw = xml.XmlDocument.parse(xmlString);
    var elements = raw.findAllElements("PLANT");

    for (var item in elements) {
      planta.add(Planta(
          item.findElements("COMMON").first.text,
          item.findElements("BOTANICAL").first.text,
          item.findElements("ZONE").first.text,
          item.findElements("LIGHT").first.text,
          item.findElements("PRICE").first.text,
          item.findElements("AVAILABILITY").first.text,
          item.findElements("image").first.text));
    }
    return planta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(
            height: 325, // establece una altura fija para el contenedor
            child: Container(
              child: FutureBuilder(
                future: getComidaFromXML(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: _listComida(snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 325, // establece una altura fija para el contenedor
            child: Container(
              child: FutureBuilder(
                future: getPlantaFromXML(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: _listPlanta(snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _listComida(data) {
  List<Widget> comidaList = [];
  comidaList.add(const Card(child: Center(child: Text("comida.xml"))));
  for (var comida in data) {
    comidaList.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(comida.image.toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nombre: " + comida.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                    Text(
                      "Precio: " + comida.price.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Descripción: " + comida.description.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Calorías: " + comida.calories.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return comidaList;
}

List<Widget> _listPlanta(data) {
  List<Widget> plantaList = [];
  plantaList.add(const Card(child: Center(child: Text("Planta.xml"))));
  for (var planta in data) {
    plantaList.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(planta.image.toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "En común: " + planta.commom.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                    Text(
                      "Botánica: " + planta.botanical.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Zona: " + planta.zone.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Ligero: " + planta.light.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Precio: " + planta.price.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                    Text(
                      "Disponibilidad: " + planta.availability.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return plantaList;
}
