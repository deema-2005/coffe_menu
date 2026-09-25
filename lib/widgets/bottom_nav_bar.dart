import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: theme.primaryColor, size: 28),
          Icon(Icons.favorite_border, color: theme.textTheme.bodyMedium?.color, size: 26),
          Icon(Icons.shopping_bag_outlined, color: theme.textTheme.bodyMedium?.color, size: 26),
          Icon(Icons.person_outline, color: theme.textTheme.bodyMedium?.color, size: 26),
        ],
      ),
    );
  }
}
