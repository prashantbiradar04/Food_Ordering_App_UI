class FoodModel {
  String imagecard, imageDetail, name,description;
  double price,rate;
  String specialItems;
  String category;
  FoodModel({
    required this.imagecard,
    required this.imageDetail,
    required this.name,
    required this.description,
    required this.price,
    required this.rate,
    required this.specialItems,
    required this.category,
});
}
List<FoodModel> foodProduct = [
  FoodModel(
      imagecard: 'assets/product/beef_burger.png',
      imageDetail: 'assets/product/beef_burger1.png',
      name: 'Beef Burger',
      price: 100.0,
      rate: 4.5,
      specialItems: 'Single Beef 🧀',
      description: desc,
      category: 'Burger'
  ),
  FoodModel(
      imagecard: 'assets/product/double_burger.png',
      imageDetail: 'assets/product/double_burger1.png',
      name: 'Double Burger',
      price: 130.0,
      rate: 4.9,
      specialItems: 'Double Beef 🍖',
      description: desc,
      category: 'Burger'
  ),
  FoodModel(
    imagecard: 'assets/product/cheese_burger.png',
    imageDetail: 'assets/product/cheese_burger1.png',
    name: 'Cheese Burger',
    price: 170.0,
    rate: 4.8,
    specialItems: 'Extra Cheese 🧀',
    description: desc,
    category: 'Burger',
  ),
  FoodModel(
      imagecard: 'assets/product/bacon_burger.png',
      imageDetail: 'assets/product/bacon_burger1.png',
      name: 'Bacon Burger',
      price: 200.0,
      rate: 5.0,
      specialItems: 'Mix Beef 🥩',
      description: desc,
      category: 'Burger'
  ),
  FoodModel(
      imagecard: 'assets/product/pizza.png',
      imageDetail: 'assets/product/pizza11.png',
      name: 'Chicken Pizza',
      price: 230.0,
      rate: 4.0,
      specialItems: 'Cheese Pizza 🍕',
      description: desc,
      category: 'Pizza'
  ),
  FoodModel(
    imagecard: 'assets/product/cup_cake.png',
    imageDetail: 'assets/product/cup_cake1.png',
    name: 'Cream Cake',
    price: 90.0,
    rate: 4.7,
    specialItems: 'Mix Cream 🧁',
    description: desc,
    category: 'Cup Cake',
  ),
];
var desc =
    "This is a special types of tiems, often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'specialItems sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns.";