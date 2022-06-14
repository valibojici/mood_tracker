import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/model/Record.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

/*

  Aici ar fi pagina de jurnal pentru o anumita zi
  Cel mai simplu ar fi sa primeasca prin constructor o data si sa se ocupe de ea
  Aici cred ca vorbeam sa alegem pe o scara de la 1 la 5 cum ne simtim, sa avem o lista cu sentimente
  si sa alegem ce am simtit azi + journalul efectiv gen note

*/

class Journal extends StatefulWidget {
  final DateTime currentDate;

  // TO DO schimbat sa citeasca din baza de date emotiile
  static final List<String> emotions = [
    'anger',
    'happiness',
    'sadness',
    'depressed',
    'boredom',
    'anxiety',
    'joy',
    'guilt',
    'disgust'
  ];
  static final List<Color> moodColors = [
    Colors.deepPurple,
    Colors.purple,
    Colors.blue,
    Colors.teal,
    Colors.green
  ];
  const Journal({Key? key, required this.currentDate}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  bool _hasChanged = false;
  late Record _record;
  late String _currentDate;
  Box? records;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      records = Hive.box<Record>("journal");
    } catch (e) {
      records = null;
    }
    _currentDate = DateFormat('dd-MM-yyyy').format(widget.currentDate);

    if (records != null && records!.containsKey(_currentDate)) {
      _record = Record.fromRecord(record: records!.get(_currentDate));
    } else {
      _record =
          Record(data: widget.currentDate, mood: -1, emotions: [], notes: '');
    }

    _notesController.text = _record.notes;
    _notesController.addListener(
      () => setState(() {
        _record.notes = _notesController.text;
        _hasChanged = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(DateFormat('dd-MM-yyyy').format((widget.currentDate))),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _dismiss(context),
          ),
          actions: [
            IconButton(
              onPressed: () => _submit(context),
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: () => _delete(context),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("How did you feel today?"),
              const SizedBox(height: 20),
              _moodInput(),
              const SizedBox(height: 20),
              _emotionsInput(context),
              const SizedBox(height: 20),
              _notesInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _moodInput() {
    Widget _icon(int index, {required IconData icon}) {
      return IconButton(
        onPressed: () {
          setState(() {
            _hasChanged = true;
            _record.mood = index;
          });
        },
        icon: Icon(icon),
        iconSize: 40,
        color: index == _record.mood ? Journal.moodColors[index] : Colors.grey,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon(0, icon: FontAwesomeIcons.faceSadTear),
        _icon(1, icon: FontAwesomeIcons.faceFrown),
        _icon(2, icon: FontAwesomeIcons.faceMeh),
        _icon(3, icon: FontAwesomeIcons.faceSmile),
        _icon(4, icon: FontAwesomeIcons.faceLaugh),
      ],
    );
  }

  Widget _emotionsInput(BuildContext context) {
    void _showMultiSelect(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog(
            items: Journal.emotions.map((e) => MultiSelectItem(e, e)).toList(),
            initialValue: _record.emotions,
            onConfirm: (values) {
              setState(() {
                _hasChanged = true;
                _record.emotions = values.map((e) => e.toString()).toList();
              });
            },
            listType: MultiSelectListType.CHIP,
            selectedColor: Colors.greenAccent,
            selectedItemsTextStyle: TextStyle(color: Colors.black),
            cancelText: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            ),
            confirmText: const Text(
              "Confirm",
              style: TextStyle(color: Colors.black),
            ),
            searchable: true,
            title: const Text("Select emotions"),
          );
        },
      );
    }

    return SizedBox(
      height: 50,
      width: 200,
      child: TextButton.icon(
        onPressed: () => _showMultiSelect(context),
        icon: const Icon(Icons.emoji_emotions),
        label: const Text("Select emotions"),
      ),
    );
  }

  Widget _notesInput() => TextField(
        controller: _notesController,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: "Enter text here",
          border: OutlineInputBorder(),
        ),
      );

  void _submit(BuildContext context) {
    if (_record.mood == -1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please choose a mood")));
      return;
    }
    try {
      records!.put(_currentDate, _record);
    } catch (e) {}

    Navigator.pop(context);
  }

  void _delete(BuildContext context) async {
    final action = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );

    if (action) {
      try {
        records!.delete(_currentDate);
      } catch (e) {}
      Navigator.of(context).pop();
    }
  }

  void _dismiss(BuildContext context) async {
    if (_hasChanged == false) {
      Navigator.of(context).pop();
      return;
    }

    final action = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to exit?"),
        content: const Text("Content will not be saved"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );

    if (action) {
      Navigator.of(context).pop();
      return;
    }
  }
}
