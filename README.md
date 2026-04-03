
# أذكاري 🌿

تطبيق إسلامي لإرسال تذكيرات يومية بالأذكار بشكل تلقائي ومنتظم.

---

## 📱 عن التطبيق

**أذكاري** تطبيق Flutter يتيح للمستخدم إنشاء قائمة شخصية من الأذكار وتلقّيها كإشعارات دورية بالترتيب، دون الحاجة لفتح التطبيق باستمرار.

---

## ✨ المميزات

- 📋 قائمة أذكار افتراضية جاهزة عند أول تشغيل
- ➕ إضافة وتعديل وحذف الأذكار
- 🔔 إشعارات تلقائية دورية بالترتيب عبر WorkManager
- ⚙️ التحكم في الفترة الزمنية بين الأذكار (15 دقيقة / 30 دقيقة / ساعة / 3 ساعات / يوم)
- 🔕 تفعيل وإيقاف الإشعارات من الإعدادات
- 💾 حفظ البيانات محلياً باستخدام Hive
- 🌙 واجهة عربية بالكامل RTL

---

## 🛠️ التقنيات المستخدمة

| التقنية | الاستخدام |
|---|---|
| **Flutter** | إطار العمل الرئيسي |
| **Dart** | لغة البرمجة |
| **flutter_bloc / Cubit** | إدارة الحالة |
| **Hive** | التخزين المحلي |
| **WorkManager** | تشغيل المهام في الخلفية |
| **flutter_local_notifications** | إرسال الإشعارات المحلية |

---

## 📂 هيكل المشروع

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart       ← الأذكار الافتراضية
│   │   ├── app_text_styles.dart
│   │   └── image_helper.dart
│   └── services/
│       ├── azkar_service.dart     ← التعامل مع Hive
│       ├── notification_service.dart
│       └── background_service.dart ← WorkManager dispatcher
├── cubit/
│   └── zekr cubit/
│       ├── zekr_cubit.dart
│       └── zekr_state.dart
├── screens/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── zekr_editor.dart
│   └── setting_screen.dart
└── widgets/
    ├── current_zekr.dart
    ├── home_body.dart
    ├── home_builder.dart
    ├── delete_bottom_sheet_widget.dart
    ├── interval_selector_widget.dart
    ├── selection_card_widget.dart
    └── custom_button_widget.dart
```

---

## 🚀 تشغيل المشروع

```bash
# استنساخ المشروع
git clone https://github.com/Marwanebrahim/athkari.git

# تثبيت الاعتماديات
flutter pub get

# تشغيل التطبيق
flutter run
```

---

## 📦 الاعتماديات الرئيسية

```yaml
dependencies:
  flutter_bloc: 
  hive_flutter: 
  workmanager: 
  flutter_local_notifications: 
  flutter_svg: 
  flutter_spinkit: 
```

---

## 📸 الشاشات

| Splash | Home | Add Dhikr | Settings |
|--------|------|-----------|----------|
| شاشة البداية | الشاشة الرئيسية | إضافة ذكر | الإعدادات |

---

## 👨‍💻 المطور

**Marwan Ibrahim**  
Flutter Developer  
[GitHub](https://github.com/Marwanebrahim)

</div>
