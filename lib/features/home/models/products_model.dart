class ProductsModel {
  final String id;
  final String name;
  final String imageUrl;
  final int time;
  final double rating;
  int? discount;
  bool isFavorite;

  ProductsModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.time,
    required this.rating,
    this.discount,
    this.isFavorite = false,
  });

  static List<ProductsModel> products = [
    ProductsModel(
      id: '1',
      name: 'Coco berry\nSalad',
      imageUrl: 'assets/images/ph1.png',
      time: 20,
      rating: 4.5,
      discount: 50,
    ),
    ProductsModel(
      id: '2',
      name: 'Marinated Grilled Burger',
      imageUrl: 'assets/images/ph1.png',
      time: 50,
      rating: 4.5,
    ),
    ProductsModel(
      id: '3',
      name: 'Fresh Salad with Letuce',
      imageUrl: 'assets/images/ph1.png',
      time: 30,
      rating: 4.5,
    ),
    ProductsModel(
      id: '4',
      name: 'Fresh Salad Green berry',
      imageUrl: 'assets/images/ph1.png',
      time: 10,
      rating: 4.5,
      discount: 50,
    ),
  ];
}
