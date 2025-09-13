class HomepageCard {
  final String image;
  final String name;
  final double price;
  HomepageCard({required this.image, required this.name, required this.price});
  static final List<HomepageCard> product = [
    HomepageCard(image: 'assets/images/pizza.png', name: 'Pizza', price: 2000),
    HomepageCard(image: 'assets/images/burger.png', name: 'Burger', price: 780),
    HomepageCard(
      image: 'assets/images/hotdog.png',
      name: 'Hot Dog',
      price: 480,
    ),
    HomepageCard(
      image: 'assets/images/alferado.png',
      name: 'Pasta',
      price: 1200,
    ),
    HomepageCard(
      image: 'assets/images/sandwich.png',
      name: 'Sandwich',
      price: 400,
    ),
    HomepageCard(image: 'assets/images/suchi.png', name: 'Suchi', price: 22),
    HomepageCard(
      image: 'assets/images/pancake.png',
      name: 'PanCake',
      price: 1000,
    ),
    HomepageCard(image: 'assets/images/layers.png', name: 'Cake', price: 2200),
  ];
}
