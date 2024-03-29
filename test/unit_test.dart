


import 'package:clothingshopp/models/product_model.dart';
import 'package:clothingshopp/repositories/product_repositories.dart';
import 'package:clothingshopp/services/firebase_service.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FirebaseService.db = FakeFirebaseFirestore();
  ProductRepository repo = ProductRepository();

  ///given when then
  test("description", () async {
    var data = ProductModel(
        productPrice: 45,
        userId: "1",
        imageUrl: "",
        imagePath: "",
        id: "5",
        productName: "test",
        categoryId: "5",
        productDescription: "this is desd");
    final response = await repo.addProducts(product: data);

    expect(response, true);
  });
}