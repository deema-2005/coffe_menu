import 'package:flutter/material.dart';

class CategoriesChips extends StatelessWidget {
  const CategoriesChips({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // قائمة التصنيفات الثابتة
    final categories = ['All', 'Espresso', 'Latte', 'Cappuccino'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = index == 0; // العنصر الأول محدد فقط

          return Padding(
            padding: EdgeInsets.only(right: index == categories.length - 1 ? 0 : 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : const Color(0xFFF1EAE4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
