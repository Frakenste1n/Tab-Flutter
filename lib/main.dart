import 'package:flutter/material.dart';

// Mengimpor halaman sesuai dengan nama file
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as hp;
import './hal_headset.dart' as headset;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Daftar Elektronik"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.computer), text: "Komputer"),
            Tab(icon: Icon(Icons.headset), text: "Headset"),
            Tab(icon: Icon(Icons.smartphone), text: "Smartphone"),
            Tab(icon: Icon(Icons.radio), text: "Radio"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          komputer
              .Komputer(), // Pastikan nama class sesuai dengan yang ada di file hal_computer.dart
          headset
              .Headset(), // Pastikan nama class sesuai dengan yang ada di file hal_headset.dart
          hp.Smartphone(), // Pastikan nama class sesuai dengan yang ada di file hal_smartphone.dart
          radio
              .Radio(), // Pastikan nama class sesuai dengan yang ada di file hal_radio.dart
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.computer)),
            Tab(icon: Icon(Icons.headset)),
            Tab(icon: Icon(Icons.smartphone)),
            Tab(icon: Icon(Icons.radio)),
          ],
        ),
      ),
    );
  }
}
