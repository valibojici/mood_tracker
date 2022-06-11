import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/pages/home/BottomHomeMenu.dart';
import 'package:mood_tracker/pages/home/Home.dart';

void main() {
  Widget testWidget = const MaterialApp(home: Home());

  // testeaza daca in pagina home exista widgeturile de mai jos
  group('"Home" tests', () {
    testWidgets('find "Hello" text', (tester) async {
      // testeaza daca exista textul "Hello..."
      await tester.pumpWidget(testWidget);
      expect(find.text("Hello, how was your day?"), findsOneWidget);
    });

    testWidgets('find quiz button', (tester) async {
      // testeaza daca exista textul (din butonul) pentru testul de personalitate
      await tester.pumpWidget(testWidget);
      expect(find.text("Take our personality test!"), findsOneWidget);
    });

    testWidgets('find journal button', (tester) async {
      // testeaza daca exista butonul pentru jurnalul din ziua curenta
      await tester.pumpWidget(testWidget);
      expect(find.byIcon(FontAwesomeIcons.penToSquare), findsOneWidget);
    });

    testWidgets('find bottom navigation', (tester) async {
      // testeaza daca exista butonul pentru jurnalul din ziua curenta
      await tester.pumpWidget(testWidget);
      expect(find.byType(BottomHomeMenu), findsOneWidget);
    });
  });
}
