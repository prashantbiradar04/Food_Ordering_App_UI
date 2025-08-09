import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Consts.dart';
import 'package:food_delivery/product_model.dart';


class ProductsItemsDisplay extends StatelessWidget {
  final FoodModel foodModel;
  const ProductsItemsDisplay({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 200,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Container(
          width: size.width*0.5,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: foodModel.imagecard,
                child: Image.asset(
                  foodModel.imagecard,
                  height: 130,
                  width: 170,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  foodModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                foodModel.specialItems,
                style: TextStyle(
                  height: 0.1,
                  letterSpacing: 1.1,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              RichText(
                text: TextSpan(style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text:"\₹" ,
                      style: TextStyle(
                        fontSize: 14,
                        color: red
                      ),
                      ),
                      TextSpan(text: "${foodModel.price}",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
