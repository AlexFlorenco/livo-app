import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String idUser;
  final String nameUser;

  const HomePage({super.key, required this.idUser, required this.nameUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá, ${widget.nameUser}"),
      ),
    );
  }
}
