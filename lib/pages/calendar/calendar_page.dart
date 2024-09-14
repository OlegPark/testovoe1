import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testovoe1/pages/calendar/widgets/widgets_calendar.dart';
import 'package:testovoe1/theme/theme.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColorPage,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            child: Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime.now();
                _focusedDate = DateTime.now();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DaysN(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: null, // infinite scrolling
                itemBuilder: (context, index) {
                  DateTime monthDate = _focusedDate.add(Duration(days: index * 30));
                  DateTime firstDayOfMonth = DateTime(monthDate.year, monthDate.month, 1);
                  DateTime lastDayOfMonth = DateTime(monthDate.year, monthDate.month + 1, 0);
                  int firstDayOfWeek = firstDayOfMonth.weekday;
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                firstDayOfMonth.year.toString(),
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                DateFormat.MMMM().format(firstDayOfMonth),
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 7,
                        children: List.generate(lastDayOfMonth.day + 6, (index) {
                          DateTime date = firstDayOfMonth.add(Duration(days: index - firstDayOfWeek + 1));
                          bool isSelected = date.day == _selectedDate.day &&
                              date.month == _selectedDate.month &&
                              date.year == _selectedDate.year;
                          bool isToday = date.day == DateTime.now().day &&
                              date.month == DateTime.now().month &&
                              date.year == DateTime.now().year;
                          bool isWithinMonth = date.month == firstDayOfMonth.month;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? orangeColor.withAlpha(90)
                                    : Colors.transparent,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    isWithinMonth ? date.day.toString() : '', // Hide dates from other months
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isToday ? Colors.black : Colors.black,
                                    ),
                                  ),
                                  if (isToday)
                                    Positioned(
                                      bottom: 7,
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}