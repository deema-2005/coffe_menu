import 'package:flutter_test/flutter_test.dart';
// تم تعديل الاستدعاء ليتطابق تماماً مع اسم مشروعك coffe_menu
import 'package:coffe_menu/main.dart';

void main() {
  testWidgets('Coffee menu UI smoke test', (WidgetTester tester) async {
    // بناء تطبيقك وتحديث الشاشة
    await tester.pumpWidget(const CoffeeMenuApp());

    // التحقق من وجود نصوص الواجهة الأساسية للتأكد من نجاح التشغيل
    expect(find.text('Sara'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
  });
}

