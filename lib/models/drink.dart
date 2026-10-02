class Drink {
  final String name;
  final String subtitle;
  final String price;
  final bool isAvailable;

  const Drink({
    required this.name,
    required this.subtitle,
    required this.price,
    this.isAvailable = true, // متاح بشكل افتراضي
  });
}
