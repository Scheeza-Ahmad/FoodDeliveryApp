class ResturantModel {
  final String image;
  final String name;
  final String category;
  final double rating;
  final String time;
  final String delivery;

  ResturantModel({
    required this.image,
    required this.name,
    required this.category,
    required this.rating,
    this.delivery = 'Free',
    required this.time,
  });

  static List<ResturantModel> resturant = [
    ResturantModel(
      image: 'assets/images/pizza.png',
      name: 'Rose Garden Restaurant',
      category: 'Burger • Chicken • Wings',
      rating: 4.7,
      time: '20 mins',
    ),
    ResturantModel(
      image: 'assets/images/chips.png',
      name: 'Crispy Chips Corner',
      category: 'Fries • Snacks • Fast Food',
      rating: 3.2,
      time: '10 mins',
    ),
    ResturantModel(
      image: 'assets/images/desi.png',
      name: 'Desi Delight',
      category: 'Biryani • Karahi • BBQ',
      rating: 3.9,
      time: '40 mins',
    ),
    ResturantModel(
      image: 'assets/images/continental.png',
      name: 'Continental Bites',
      category: 'Steaks • Pasta • Grills',
      rating: 2.8,
      time: '20 mins',
    ),
    ResturantModel(
      image: 'assets/images/layers.png',
      name: 'Layers Bakery',
      category: 'Cakes • Pastry • Donuts',
      rating: 3.9,
      time: '15 mins',
    ),
    ResturantModel(
      image: 'assets/images/chinease.png',
      name: 'China Town',
      category: 'Chinese • Noodles • Soup',
      rating: 4.1,
      time: '25 mins',
    ),
    ResturantModel(
      image: 'assets/images/pancake.png',
      name: 'Pancake House',
      category: 'Breakfast • Pancakes • Coffee',
      rating: 4.3,
      time: '18 mins',
    ),
    ResturantModel(
      image: 'assets/images/sandwichstop.png',
      name: 'Sandwich Stop',
      category: 'Sandwiches • Wraps • Rolls',
      rating: 4.0,
      time: '12 mins',
    ),
    ResturantModel(
      image: 'assets/images/suchi.png',
      name: 'Sushi Express',
      category: 'Japanese • Sushi • Rolls',
      rating: 4.5,
      time: '30 mins',
    ),
  ];
}
