import 'package:flutter/material.dart';
import 'package:testovoe1/theme/theme.dart';
import '../calendar/calendar_page.dart';
import 'widgets/widgets_mood_diary.dart';

class MoodDiary extends StatelessWidget {
  final ValueNotifier<bool> _isStatisticsMode = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          getCurrentDate(),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.grey,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  ValueListenableBuilder(
                    valueListenable: _isStatisticsMode,
                    builder: (context, isStatisticsMode, child) {
                      if (!isStatisticsMode) {
                        return Image.asset('assets/images/statistics.jpg');
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Text(
                    'Что чувствуешь?',
                    style: TextStyle(
                      color: colortext,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  HorizontalCardList(),
                  SizedBox(height: 20),
                  EmotionWrap1(),
                  SizedBox(height: 36),
                  Text(
                    'Уровень стресса',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SliderWidget1(),
                  SizedBox(height: 36),
                  Text(
                    'Самооценка',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SliderWidget2(),
                  SizedBox(height: 36),
                  Text(
                    'Заметки',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  NotesWidget(),
                  SizedBox(height: 35),
                  ButtonSave(),
                  SizedBox(height: 250,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SwitchMS(
              onSwitchChanged: (isStatisticsMode) {
                _isStatisticsMode.value = isStatisticsMode;
              },
            ),
          ),
        ],
      ),
    );
  }
}