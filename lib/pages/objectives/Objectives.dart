import 'package:flutter/material.dart';

/*
  Aici ar fi obiectivele, nu stiu ce si cum facem aici
  Poate obiectivele astea sa fie de la aplicatie? de ex. Sa ai 3 zile la rand in care completezi mai mult
  de 50 de cuvinte? idk

*/

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  State<Objectives> createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Objectives")),
      body: const Center(
        child: Text(
            "Aici ar trebui sa fie obiectivele, nu prea stiu exact ce facem aici"),
      ),
    );
  }
}
