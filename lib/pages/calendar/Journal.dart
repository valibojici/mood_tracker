import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*

  Aici ar fi pagina de jurnal pentru o anumita zi
  Cel mai simplu ar fi sa primeasca prin constructor o data si sa se ocupe de ea
  Aici cred ca vorbeam sa alegem pe o scara de la 1 la 5 cum ne simtim, sa avem o lista cu sentimente
  si sa alegem ce am simtit azi + journalul efectiv gen note

*/

class Journal extends StatefulWidget {
  final DateTime dataCurenta;
  const Journal({Key? key, required this.dataCurenta}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('dd-MM-yyyy').format((widget.dataCurenta))),
      ),
      body: const Center(
        child: Text(
            "Jurnalul o anumita zi (gen dai tap pe o zi din calendar si ajungi aici)"),
      ),
    );
  }
}
