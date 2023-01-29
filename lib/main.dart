import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo2/View/main_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  // calendar 언어 변경

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainCalendar(),
    );
  }
}
