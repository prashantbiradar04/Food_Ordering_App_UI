import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Consts.dart';
import 'package:food_delivery/food_delivery_home_screen.dart';

class MyOnBoardPage extends StatelessWidget {
  const MyOnBoardPage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: imageBackground,
            child: Image.asset(
              'assets/food pattern.png',
              color: imageBackground2,
              repeat: ImageRepeat.repeatY,
            ),
          ),
          Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: Image.asset('assets/chef.png'),
          ),
          Positioned(
            top: 150,
            right: 5,
            child: Image.asset('assets/leaf.png', width: 80),
          ),
          Positioned(
            top: 70,
            right: 40,
            child: Image.asset('assets/chili.png', width: 80),
          ),
          Positioned(
            top: 70,
            left: 5,
            child: Image.asset('assets/ginger.png', height: 90, width: 90),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "The Fastest In ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "Food",
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                            text: " Delivery ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "Our job is to filling your tummy with delicious food and fast delivery",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          3,
                          (index) => Container(
                            width: index == 0 ? 20 : 10,
                            height: 10,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: index == 0 ? orange : grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FoodDeliveryHomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      color: red,
                      height: 65,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width / 2, -20, 0, 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
