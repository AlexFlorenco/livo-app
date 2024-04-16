import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String idUser;
  final String nameUser;
  final String? photoUrl;

  const HomePage({
    super.key,
    required this.idUser,
    required this.nameUser,
    this.photoUrl,
  });

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
      body: Center(
        child: Image.network(widget.photoUrl ??
            'https://sites.cns.utexas.edu/sites/default/files/geometry_lab/files/default_person.jpg?m=1654796730'),
      ),
    );
  }
}
