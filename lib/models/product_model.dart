class ProductModel {
  final String image, name;
  final double price, rate;

  ProductModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.rate});
}

List<ProductModel> productModel = [
  ProductModel(
      image: 'sapporo_miso_ramen.png',
      name: 'Sapporo Miso',
      price: 3.9,
      rate: 5),
  ProductModel(
      image: 'kurume_ramen.png', name: 'Kurume Ramen', price: 4.3, rate: 4.9),
  ProductModel(
      image: 'hakata_ramen.png', name: 'Hakata Ramen', price: 3.9, rate: 4.8),
  ProductModel(
      image: 'shrimp_fried_rice.png',
      name: 'Shrimp Fried Rice',
      price: 4.9,
      rate: 4.5),
  ProductModel(
      image: 'fullset_ramen.png', name: 'Fullset Ramen', price: 5.9, rate: 4.7),
];
