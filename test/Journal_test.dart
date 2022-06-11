import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/pages/calendar/Journal.dart';

void main() {
  Widget testWidget = MaterialApp(home: Journal(currentDate: DateTime.now()));
  testWidgets('find mood icon and test tap', (tester) async {
    // testeaza daca dupa ce se da tap pe un "mood icon" el devine activ
    await tester.pumpWidget(testWidget);

    // gasesc iconul din mijloc
    Finder iconFinder = find.ancestor(
        of: find.byIcon(FontAwesomeIcons.faceMeh),
        matching: find.byType(IconButton));

    // dau tap pe el
    await tester.tap(iconFinder);
    // refresh la widget
    await tester.pump();

    // gasesc iconul
    iconFinder = find.ancestor(
        of: find.byIcon(FontAwesomeIcons.faceMeh),
        matching: find.byType(IconButton));

    // testez daca are culoarea setata (diferita de gri)
    expect(tester.widget<IconButton>(iconFinder).color, Journal.moodColors[2]);
  });

  testWidgets('find text field and check input', (tester) async {
    // testeaza text input

    await tester.pumpWidget(testWidget);
    await tester.enterText(find.byType(TextField), 'testing text field');
    expect(find.text('testing text field'), findsOneWidget);
  });
}
