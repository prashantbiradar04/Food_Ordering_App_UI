import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Consts.dart';
import 'package:food_delivery/categories_model.dart';
import 'package:food_delivery/food_detail_screen.dart';
import 'package:food_delivery/product_model.dart';
import 'package:food_delivery/products_items_display.dart';

class FoodDeliveryHomeScreen extends StatefulWidget {
  const FoodDeliveryHomeScreen({super.key});

  @override
  State<FoodDeliveryHomeScreen> createState() => _FoodDeliveryHomeScreenState();
}

class _FoodDeliveryHomeScreenState extends State<FoodDeliveryHomeScreen> {
  int selectedIndex = 0;
  String category = "Burger";
  List<FoodModel> myFoodModel = foodProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarParts(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBanner(),
                const SizedBox(height: 35),
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          categoryItems(),
          const SizedBox(height: 10),
          viewAll(),
          //for displaying items
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: List.generate(
                myFoodModel.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: index == foodProduct.length - 1 ? 25 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) =>
                            FoodDetailScreen(product: myFoodModel[index]),
                      ),
                    ),
                    child: ProductsItemsDisplay(foodModel: foodProduct[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 45,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_filled, color: red, size: 30),
                SizedBox(width: 5),
                CircleAvatar(radius: 3, backgroundColor: Colors.red),
              ],
            ),
            Icon(Icons.favorite_outline_rounded, color: red, size: 30),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(shape: BoxShape.circle, color: red),
              child: Center(
                child: Icon(Icons.search, size: 25, color: Colors.white),
              ),
            ),
            Icon(Icons.notifications_outlined, color: red, size: 30),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: red, shape: BoxShape.circle),
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding viewAll() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Now",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text("View All", style: TextStyle(color: orange, fontSize: 14)),
              const SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    //for displaying categories
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: List.generate(
          myCategories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 25),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  category = myCategories[index].name;
                  category == "All"
                      ? myFoodModel = foodProduct
                      : myFoodModel = foodProduct
                            .where(
                              (elements) =>
                                  elements.category.toLowerCase() ==
                                  myCategories[index].name.toLowerCase(),
                            )
                            .toList();
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: category == myCategories[index].name ? red : grey1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: category == myCategories[index].name
                            ? Colors.white
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        myCategories[index].image,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      myCategories[index].name,
                      style: TextStyle(
                        color: category == myCategories[index].name
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container appBanner() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: imageBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: "The Fastest  In ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Food",
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: "  Delivery ",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  child: Text(
                    "Order Now",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/courier.png"),
        ],
      ),
    );
  }

  AppBar appBarParts() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        const SizedBox(width: 25),
        Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: grey1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/dash.png"),
        ),
        const Spacer(),
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 18, color: red),
            SizedBox(width: 5),
            Text(
              "Wagholi, Pune",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(width: 25),
            Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: orange),
          ],
        ),
        Spacer(),
        Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: grey1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/profile.png"),
        ),
        SizedBox(width: 25),
      ],
    );
  }
}
