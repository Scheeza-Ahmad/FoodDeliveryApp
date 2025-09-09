class HomepageCard {
  final String image;
  final String name;
  final String price;
  HomepageCard({required this.image, required this.name, required this.price});
  static final List<HomepageCard> product = [
    HomepageCard(
      image: 'assets/images/pizza.png',
      name: 'Pizza',
      price: "\$70",
    ),
    HomepageCard(
      image: 'assets/images/burger.png',
      name: 'Burger',
      price: "\$40",
    ),
    HomepageCard(
      image: 'assets/images/hotdog.png',
      name: 'Hot Dog',
      price: "\$20",
    ),
    HomepageCard(
      image: 'assets/images/alferado.png',
      name: 'Pasta',
      price: '\$19',
    ),
    HomepageCard(
      image: 'assets/images/sandwich.png',
      name: 'Sandwich',
      price: '\$22',
    ),
    HomepageCard(
      image: 'assets/images/suchi.png',
      name: 'Suchi',
      price: '\$22',
    ),
    HomepageCard(
      image: 'assets/images/pancake.png',
      name: 'PanCake',
      price: '\$12',
    ),
    HomepageCard(
      image: 'assets/images/layers.png',
      name: 'Cake',
      price: '\$19',
    ),
  ];
}
