import 'package:flutter/material.dart';
import '../models/drink.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;

  const DrinkCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // تطبيق طبقة شفافية للكارت بالكامل إذا كان المنتج sold out
    return Opacity(
      opacity: drink.isAvailable ? 1.0 : 0.5,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: drink.isAvailable ? theme.cardColor : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                  Icons.coffee,
                  size: 36,
                  color: drink.isAvailable ? theme.primaryColor : Colors.grey.shade600
              ),
            ),
            const SizedBox(height: 12),
            Text(
              drink.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              drink.subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  drink.price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: theme.primaryColor),
                ),

                if (drink.isAvailable)
                  Icon(Icons.add_circle, color: theme.primaryColor, size: 24)
                else
                  Text(
                    'SOLD OUT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
