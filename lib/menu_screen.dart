import 'package:flutter/material.dart';
// استيراد القطع الصغيرة (سننشئها في الخطوات القادمة)
import 'widgets/greeting_row.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/categories_chips.dart';
import 'widgets/offer_card.dart';
import 'widgets/popular_section.dart';
import 'widgets/bottom_nav_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // المسافة الجانبية المطلوبة في التصميم = 20
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              GreetingRow(),
              SizedBox(height: 24), // الفراغ بين الأقسام = 24
              SearchBarWidget(),
              SizedBox(height: 24),
              CategoriesChips(),
              SizedBox(height: 24),
              OfferCard(), // كارت التحدي الإيجابي
              SizedBox(height: 24),
              PopularSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
