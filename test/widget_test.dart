//
// import 'package:clothingshopp/screens/category/single_category_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() async {
//   ///given when then
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   testWidgets("description", (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(
//       home: SingleCategoryScreen(),
//     ));
//
//     // Expect that there are 5 ListTiles with specific text in the ListView
//     expect(find.text('Item 0'), findsOneWidget);
//     expect(find.text('Item 1'), findsOneWidget);
//     expect(find.text('Item 2'), findsOneWidget);
//     expect(find.text('Item 3'), findsOneWidget);
//     expect(find.text('Item 4'), findsOneWidget);
//
//     // Verify that there are no other productCard present
//     expect(find.byKey(Key('productCard')),
//         findsNWidgets(4)); // There should be exactly 5 productCard
//   });
// }

import 'package:clothingshopp/viewmodels/single_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clothingshopp/screens/category/single_category_screen.dart';

void main() {
  testWidgets('SingleCategoryScreen displays correctly', (WidgetTester tester) async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Build our app and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<SingleCategoryViewModel>(
          create: (_) => SingleCategoryViewModel(),
          child: SingleCategoryBody(),
        ),
      ),
    );

    // Verify that the loading indicator is shown initially
    expect(find.text('Please wait'), findsOneWidget);

    // Simulate data loading by triggering a rebuild
    await tester.pump();

    // Verify that the correct widgets are displayed after data is loaded
    expect(find.text('Category Name'), findsOneWidget); // Replace 'Category Name' with the actual category name you expect
    // expect(find.byType(ProductCard), findsWidgets);
    expect(find.byKey(Key('productCard')),
        findsNWidgets(4));
    // TODO: Add more specific widget checks based on your UI structure
  });
}
