import 'package:clothingshopp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  testWidgets('Sliders Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Sliders(),
      ),
    ));

    // Verify that the widget is rendered correctly
    expect(find.byType(Sliders), findsOneWidget);
    expect(find.byType(CarouselSlider), findsOneWidget);


  });
}
