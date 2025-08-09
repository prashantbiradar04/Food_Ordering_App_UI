import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Consts.dart';
import 'package:food_delivery/product_model.dart';
import 'package:readmore/readmore.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodModel product;
  const FoodDetailScreen({super.key, required this.product});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: detailAppBar(context),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: imageBackground,
            child: Image.asset(
              "assets/food pattern.png",
              repeat: ImageRepeat.repeatY,
              color: imageBackground2,
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Hero(
                      tag: widget.product.imagecard,
                      child: Image.asset(
                        widget.product.imageDetail,
                        height: 320,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.product.specialItems,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "\₹",
                              style: TextStyle(fontSize: 14, color: red),
                            ),
                            TextSpan(
                              text: "${widget.product.price}",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodInfo(
                        "assets/icon/star.png",
                        widget.product.rate.toString(),
                      ),
                      foodInfo("assets/icon/fire.png", "150k"),
                      foodInfo("assets/icon/time.png", "10-15 Min"),
                    ],
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    trimLength: 110,
                    trimCollapsedText: "Read More",
                    trimExpandedText: "Read Less",
                    colorClickableText: red,
                    moreStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: red,
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        label: MaterialButton(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            height: 65,
            color: red,
            minWidth:300,
            child: Center(
              child: Text("Add to Cart",style: TextStyle(color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.3),),
            ),
            onPressed: () {}),
      ),
    );
  }

  Row foodInfo(image, value) {
    return Row(
      children: [
        Image.asset(image, width: 25),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }

  AppBar detailAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      forceMaterialTransparency: true,
      actions: [
        const SizedBox(width: 27),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Icon(Icons.more_horiz_outlined, color: Colors.black, size: 18),
        ),
        SizedBox(width: 27),
      ],
    );
  }
}
