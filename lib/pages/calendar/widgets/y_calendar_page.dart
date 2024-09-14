import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../theme/theme.dart';

class YearlyCalendarPage extends StatefulWidget {
  @override
  _YearlyCalendarPageState createState() => _YearlyCalendarPageState();
}

class _YearlyCalendarPageState extends State<YearlyCalendarPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColorPage,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            child: const Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            onPressed: () {
              setState(() {
                DateTime now = DateTime.now();
                _selectedDate = now;
                _focusedDate = now;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Text(
              DateTime.now().year.toString(),
              style: const TextStyle(fontSize: 24, color: colortext, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: List.generate(12, (index) {
                    DateTime monthDate = DateTime(DateTime.now().year, index + 1, 1);
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: MonthColumn(
                        monthDate: monthDate,
                        selectedDate: _selectedDate,
                        focusedDate: _focusedDate,
                        onDateChanged: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthColumn extends StatelessWidget {
  final DateTime monthDate;
  final DateTime selectedDate;
  final DateTime focusedDate;
  final ValueChanged<DateTime> onDateChanged;

  const MonthColumn({
    required this.monthDate,
    required this.selectedDate,
    required this.focusedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(monthDate.year, monthDate.month, 1);
    DateTime lastDayOfMonth = DateTime(monthDate.year, monthDate.month + 1, 0);
    int firstDayOfWeek = firstDayOfMonth.weekday;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat.MMMM().format(monthDate),
            style: const TextStyle(fontSize: 14, color: colortext, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 7,
          children: List.generate(lastDayOfMonth.day + 6, (index) {
            DateTime date = firstDayOfMonth.add(Duration(days: index - firstDayOfWeek + 1));
            bool isSelected = date.day == selectedDate.day &&
                date.month == selectedDate.month &&
                date.year == selectedDate.year;
            bool isToday = date.day == DateTime.now().day &&
                date.month == DateTime.now().month &&
                date.year == DateTime.now().year;
            bool isWithinMonth = date.month == firstDayOfMonth.month;

            return GestureDetector(
              onTap: () {
                onDateChanged(date);
              },
              child: Container(
                margin: const EdgeInsets.all(4),
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
                      isWithinMonth ? date.day.toString() : '',
                      style: TextStyle(
                        fontSize: 10,
                        color: isToday ? colortext : colortext,
                      ),
                    ),
                    if (isToday)
                      Positioned(
                        bottom: 1,
                        child: Container(
                          width: 3,
                          height: 3,
                          decoration: const BoxDecoration(
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
  }
}