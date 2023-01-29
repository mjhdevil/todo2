import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class MainCalendar extends StatefulWidget {
  @override
  State<MainCalendar> createState() => _MainCalendarState();
}

class _MainCalendarState extends State<MainCalendar> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: TableCalendar(
          locale: 'ko_KR',
          focusedDay: focusedDay,
          firstDay: DateTime(2023),
          lastDay: DateTime(2024),
          headerStyle: HeaderStyle(
            titleCentered: true, // 제목 중앙 위치
            formatButtonVisible: false, // 달력 크기 선택 옵션 없애기
          ),
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            // 선택된 날짜의 상태를 갱신합니다.
            setState(() {
              this.selectedDay = selectedDay;
              this.focusedDay = focusedDay;
            });
          },
          selectedDayPredicate: (DateTime day) {
            // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
            return isSameDay(selectedDay, day);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Column(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[300],
                )),
              ),
            ],
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
