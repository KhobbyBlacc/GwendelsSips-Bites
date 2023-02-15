import 'package:flutter/material.dart';

class FoodModel with ChangeNotifier {
  final String id;
  final String foodName;
  final String foodImage;
  final double price;
  final String description;
  

  FoodModel({
    required this.id,
    required this.foodName,
    required this.foodImage,
    required this.price,
    required this.description,
  });
}

class Products with ChangeNotifier {
  final List<FoodModel> _food = [
    FoodModel(
        id: "1",
        foodName: "Cake",
        foodImage: "assets/images/gCake1.png",
        price: 50.00,
        description: "Burger For all"),
    FoodModel(
        id: "2",
        foodName: "Cheese Chilly",
        foodImage: "assets/images/gCake2.png",
        price: 46.00,
        description: "Cheesy Chilly"),
    FoodModel(
        id: "3",
        foodName: "Noodles",
        foodImage: "assets/images/gCake3.png",
        price: 50.00,
        description: "Noodles For all"),
    FoodModel(
        id: "4",
        foodName: "Pizza",
        foodImage: "assets/images/gCake4.png",
        price: 67.00,
        description: "MeatEater available"),
    FoodModel(
        id: "5",
        foodName: "DoughMan Biggles",
        foodImage: "assets/images/gCake5.png",
        price: 35.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "6",
        foodName: "Bigles DoughNut",
        foodImage: "assets/images/gCake7.png",
        price: 37.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "8",
        foodName: "Fries Ofresh",
        foodImage: "assets/images/sobolo1.png",
        price: 180.00,
        description: "Creamy Cakes available"),
        FoodModel(
        id: "7",
        foodName: "Hot dog",
        foodImage: "assets/images/sobolo2.png",
        price: 350.00,
        description: "Creamy Cakes available"),
        FoodModel(
        id: "7",
        foodName: "Hot dog",
        foodImage: "assets/images/sobolo4.png",
        price: 350.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "8",
        foodName: "Fries Ofresh",
        foodImage: "assets/images/rice1.png",
        price: 180.00,
        description: "Creamy Cakes available"),
         FoodModel(
        id: "9",
        foodName: "Hot dog",
        foodImage: "assets/images/sam2.png",
        price: 350.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "10",
        foodName: "Fries Ofresh",
        foodImage: "assets/images/sma1.png",
        price: 180.00,
        description: "Creamy Cakes available"),
         FoodModel(
        id: "11",
        foodName: "Hot dog",
        foodImage: "assets/images/cookies1.png",
        price: 350.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "12",
        foodName: "Fries Ofresh",
        foodImage: "assets/images/cookies2.png",
        price: 180.00,
        description: "Creamy Cakes available"),
         FoodModel(
        id: "13",
        foodName: "Hot dog",
        foodImage: "assets/images/cookies3.png",
        price: 350.00,
        description: "Creamy Cakes available"),
    FoodModel(
        id: "14",
        foodName: "Fries Ofresh",
        foodImage: "assets/images/sobolo5.png",
        price: 180.00,
        description: "Creamy Cakes available"),
  ];

  List<FoodModel> get food {
    return [..._food];
  }

  FoodModel findById(String id) {
    return _food.firstWhere((foodPdt) => foodPdt.id ==id);
  }
}
