// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget/main.dart';

void main() {
  testWidgets('Student tracking system test', (WidgetTester tester) async {
    // MyApp'i MaterialApp içinde kullanıyoruz ve const kaldırılıyor
    await tester.pumpWidget(MaterialApp(home: MyApp()));

    // Başlık kontrolü
    expect(find.text('Öğrenci Takip Sistemi'), findsOneWidget);

    // Öğrenci listesinin kontrolü (3 öğrenci olduğu için)
    expect(find.byType(ListTile), findsNWidgets(3));

    // Butonların varlığını kontrol etme
    expect(find.text('Yeni Öğrenci'), findsOneWidget);
    expect(find.text('Güncelle'), findsOneWidget);
    expect(find.text('Sil'), findsOneWidget);
  });
}
