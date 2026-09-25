import 'package:flutter/material.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // بيانات تجريبية ثابتة للمشروبات لملء الشبكة
    final drinks = [
      {'name': 'Caramel Macchiato', 'subtitle': 'With oat milk', 'price': '\$4.50'},
      {'name': 'Caffè Latte', 'subtitle': 'Rich & creamy', 'price': '\$4.00'},
      {'name': 'Cappuccino', 'subtitle': 'Frothy espresso', 'price': '\$4.25'},
      {'name': 'Flat White', 'subtitle': 'Double shot shot', 'price': '\$3.75'},
    ];

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
        // استخدام GridView.builder مع تعطيل التمرير الداخلي لمنع تعارض الحجم وتجنب الـ Overflow
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: drinks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع للكارت
          ),
          itemBuilder: (context, index) {
            final drink = drinks[index];
            return _buildDrinkCard(context, drink['name']!, drink['subtitle']!, drink['price']!, theme);
          },
        ),
      ],
    );
  }

  Widget _buildDrinkCard(BuildContext context, String name, String subtitle, String price, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنصر نائب للصورة (Placeholder) بالمواصفات المطلوبة تماماً
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF1EAE4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.coffee, size: 36, color: theme.primaryColor),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
