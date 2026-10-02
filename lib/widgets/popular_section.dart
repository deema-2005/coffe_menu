import 'package:flutter/material.dart';
import '../models/drink.dart';
import 'drink_card.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  // إضافة const هنا تمنع التعارض وتجعل المصفوفة متوافقة تماماً مع شروط StatelessWidget
  final List<Drink> _drinks = const [
    Drink(name: 'Caramel Macchiato', subtitle: 'With oat milk', price: '\$4.50'),
    Drink(name: 'Caffè Latte', subtitle: 'Rich & creamy', price: '\$4.00'),
    Drink(name: 'Cappuccino', subtitle: 'Frothy espresso', price: '\$4.25'),
    Drink(name: 'Flat White', subtitle: 'Double shot shot', price: '\$3.75', isAvailable: false), // كارت منتج sold out المطلوب
    Drink(name: 'Iced Americano', subtitle: 'Classic black', price: '\$3.50'),                    // مشروب إضافي 1
    Drink(name: 'Caffè Mocha', subtitle: 'Chocolate fusion', price: '\$4.80'),                    // مشروب إضافي 2
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular',
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              'See all',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: theme.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // بناء عناصر الشبكة من القائمة البرمجية ديناميكياً وبأسلوب نظيف
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
          children: _drinks.map((drink) => DrinkCard(drink: drink)).toList(),
        ),
      ],
    );
  }
}



