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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
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
                  const Text(
                    'Что чувствуешь?',
                    style: TextStyle(
                      color: colortext,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const HorizontalCardList(),
                  const SizedBox(height: 20),
                  EmotionWrap1(),
                  const SizedBox(height: 36),
                  const Text(
                    'Уровень стресса',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const SliderWidget1(),
                  const SizedBox(height: 36),
                  const Text(
                    'Самооценка',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const SliderWidget2(),
                  const SizedBox(height: 36),
                  const Text(
                    'Заметки',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const NotesWidget(),
                  const SizedBox(height: 35),
                  const ButtonSave(),
                  const SizedBox(height: 250,),
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