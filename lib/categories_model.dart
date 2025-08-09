class Category {
  String image, name;

  Category({required this.image, required this.name});
}

  List<Category> myCategories = [
    Category(image: 'assets/all.png',
      name: "All",
    ),
    Category(image: 'assets/burger.png',
      name: "Burger",
    ),
    Category(image: 'assets/pizza.png',
      name: "Pizza",
    ),
    Category(image: 'assets/cup_cake.png',
      name: "Cup Cake",
    )
  ];
