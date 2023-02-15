import 'package:gwendels_sips_n_bites/Models/food_model.dart';

List bannerImage = [
  "assets/images/burger.jpg",
  "assets/images/cheesechilly.jpg",
  "assets/images/noodles.jpg",
  "assets/images/pizza.jpg"
];

List items = bannerImage.length as List;

List bannerItems = ["Burger", "Cheese Chilly", "Noodles", "Pizza"];

List bannerDescription = [
  "Burger For all",
  "Cheese Chilly for me",
  "Noodles for the chinese",
  "Pizza Menkoaa"
];

List<FoodModel> food = [
  FoodModel(
      id: "1",
      foodName: "Burger",
      price: 50.00,
      foodImage: "assets/images/burger.jpg",
      description: "Burger For all"),
      FoodModel(
         id: "2",
      foodName: "Cheese Chilly",
      price: 46.00,
      foodImage: "assets/images/cheesechilly.jpg",
      description: "Cheesy Chilly"),
      FoodModel(
         id: "3",
      foodName: "Noodles",
      price: 50.00,
      foodImage: "assets/images/noodles.jpg",
      description: "Noodles For all"),
      FoodModel(
         id: "4",
      foodName: "Pizza",
      price: 67.00,
      foodImage: "assets/images/pizza.jpg",
      description: "MeatEater available"),
       FoodModel(
         id: "5",
      foodName: "DoughMan Biggles",
      price: 35.00,
      foodImage: "assets/images/02.jpg",
      description: "Creamy Cakes available"),
      FoodModel(
         id: "6",
      foodName: "Bigles DoughNut",
      price: 37.00,
      foodImage: "assets/images/01.jpg",
      description: "Creamy Cakes available"),
      FoodModel(
         id: "7",
      foodName: "Hot dog",
      price: 350.00,
      foodImage: "assets/images/03.jpg",
      description: "Creamy Cakes available"),
      FoodModel(
         id: "7",
      foodName: "Fries Ofresh",
      price: 180.00,
      foodImage: "assets/images/04.jpg",
      description: "Creamy Cakes available"),
];
