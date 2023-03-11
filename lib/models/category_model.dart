class Category {
  final String image, name;

  Category({required this.image, required this.name});
}

List<Category> categories = [
  Category(image: 'ramen.png', name: 'Ramen'),
  Category(image: 'burger.png', name: 'Burger'),
  Category(image: 'salad.png', name: 'Salad'),
  Category(image: 'pancake.png', name: 'Waffle'),
];
