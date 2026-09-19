// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

void main() {
  runApp(const MyCardApp());
}

class MyCardApp extends StatefulWidget {
  const MyCardApp({super.key});

  @override
  State<MyCardApp> createState() => _MyCardAppState();
}

class _MyCardAppState extends State<MyCardApp> {
  Uint8List? _imageBytes;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500, // تحديد عرض الصورة لتقليل حجمها
      maxHeight: 500, // تحديد ارتفاع الصورة
      imageQuality: 80, // تقليل جودة الذاكرة المستهلكة لـ 80%
    );
    if (pickedFile != null) {
      final Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1B3B5A), // لون الخلفية الأزرق الداكن
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  اكتب هذا الكود مكانه:
              GestureDetector(
                onTap: _pickImage, // عند الضغط يتم استدعاء دالة فتح الاستوديو
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.white, // خلفية بيضاء للدائرة
                  backgroundImage:
                      _imageBytes != null ? MemoryImage(_imageBytes!) : null,
                  child: _imageBytes == null
                      ? const Icon(
                          Icons.add, // أيقونة الزائد +
                          size: 40.0,
                          color: Color(
                              0xFF1B3B5A), // لون الأيقونة أزرق داكن متناسق مع الخلفية
                        )
                      : null,
                ),
              ),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // لجعل الاسم في المنتصف تماماً
                children: const [
                  Text(
                    "Bayan ",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white, // لون الاسم الأول
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  Text(
                    "Alissa",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.amber, // لون الكنية
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white24,
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white70,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // لون الدائرة الأساسي (يمكنك تغييره لاحقاً لصورة)
              Card(
                margin: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0), // أبعاد المربع
                child: ListTile(
                  leading: Icon(Icons.phone,
                      color: Color(0xFF1B3B5A)), // أيقونة الهاتف جهة اليسار
                  //  اكتبي هذا الـ TextField مكانه:
                  title: TextField(
                    keyboardType:
                        TextInputType.phone, // تفتح كيبورد الأرقام للمستخدم
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          'phone number', // العلامة المائية المطلوبة للرقم
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                      border: InputBorder
                          .none, // تخفي الخط السفلي حتى لا يخرب شكل الـ Card الأبيض
                    ),
                  ),
                ),
                // هنا سنضع المحتوى الداخلي في الخطوة التالية
              ),

              // 2. بطاقة البريد الإلكتروني (الجديدة)
              Card(
                margin: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0), // نفس الأبعاد للتناسق
                child: ListTile(
                  leading: Icon(Icons.email,
                      color: Color(0xFF1B3B5A)), // أيقونة الإيميل
                  //  اكتبي هذا الـ TextField مكانه:
                  title: TextField(
                    keyboardType: TextInputType
                        .emailAddress, // تفتح كيبورد يحتوي على زر @ لتسهيل كتابة الإيميل
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          'enter your email', // العلامة المائية المطلوبة للإيميل
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                      border: InputBorder.none, // تخفي الخط السفلي المزعج
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
