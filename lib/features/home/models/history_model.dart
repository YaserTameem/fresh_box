class HistoryModel {
  final String restaurantName;
  final String restaurantImage;
  final String orderDate;
  final String orderStatus;
  final bool isDelivered;
  final double totalPrice;

  HistoryModel({
    required this.isDelivered,
    required this.restaurantName,
    required this.restaurantImage,
    required this.orderDate,
    required this.orderStatus,
    required this.totalPrice,
  });

  static List<HistoryModel> historyData = [
    HistoryModel(
      restaurantName: 'Starbucks',
      restaurantImage: 'assets/images/star_bucks.png',
      orderDate: '17 Jan, 02:30. 3 items',
      orderStatus: 'Delivered',
      isDelivered: true,
      totalPrice: 30,
    ),
    HistoryModel(
      restaurantName: 'Domino’s Pizza',
      restaurantImage: 'assets/images/domino_pizza.png',
      orderDate: '29 Jan, 02:30. 2 items',
      orderStatus: 'Cancelled',
      isDelivered: false,
      totalPrice: 40.50,
    ),
    HistoryModel(
      restaurantName: 'Pizza Hut',
      restaurantImage: 'assets/images/pizza_hut.png',
      orderDate: '30 Jan, 02:30. 3 items',
      orderStatus: 'Delivered',
      isDelivered: true,
      totalPrice: 55.00,
    ),
  ];
}
