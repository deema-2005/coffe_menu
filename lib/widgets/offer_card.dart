import 'package:flutter/material.dart';
import 'dart:math' as math;

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 2. استخدام ClipRRect لقص الدوائر الخلفية عند حواف الكارت المنحنية
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 140,
        color: theme.primaryColor, // اللون البني الموحد من الـ Theme
        // 1. استخدام Stack لوضع الدوائر في الخلفية والنصوص فوقها
        child: Stack(
          children: [
            // الدائرة الخلفية الأولى
            Positioned(
              right: -40,
              top: -40,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xFFF1EAE4).withOpacity(0.15),
              ),
            ),
            // الدائرة الخلفية الثانية
            Positioned(
              right: 20,
              bottom: -50,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFF1EAE4).withOpacity(0.1),
              ),
            ),
            // محتويات الكارت النصية (الجهة اليسرى)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 4. استخدام Text.rich وكتابة TextSpan لتنسيق النص بأحجام مختلفة في سطر واحد
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Save 50%\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.surface,
                          ),
                        ),
                        TextSpan(
                          text: 'on your first order',
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.surface.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 5. استخدام Wrap لعرض الحبات الصغيرة لتجنب الـ Overflow إذا ضاقت الشاشة
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      _buildMiniPill('Code: AREISTO', theme),
                      _buildMiniPill('Today only', theme),
                    ],
                  )
                ],
              ),
            ),
            // 3. استخدام Transform.rotate لتدوير شارة الخصم المائلة بزاوية راديان
            Positioned(
              right: 30,
              top: 40,
              child: Transform.rotate(
                angle: -15 * (math.pi / 180), // تحويل -15 درجة إلى راديان
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary, // لون الكراميل من الـ Theme
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '-50%',
                    style: TextStyle(
                      color: theme.colorScheme.surface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMiniPill(String text, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: theme.colorScheme.surface, fontSize: 10),
      ),
    );
  }
}
