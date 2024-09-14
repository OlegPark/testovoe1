import 'package:flutter/material.dart';
import 'package:testovoe1/theme/theme.dart';
import '../calendar/calendar_page.dart';
import 'widgets/widgets_mood_diary.dart';

class MoodDiary extends StatelessWidget {
  final ValueNotifier<bool> _isStatisticsMode = ValueNotifier(true);
  final ValueNotifier<int> _selectedEmotion = ValueNotifier(-1);

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
                  HorizontalCardList(
                    onEmotionSelected: (index) {
                      _selectedEmotion.value = index;
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: _selectedEmotion,
                    builder: (context, selectedEmotion, child) {
                      if (selectedEmotion == 0) {
                        return EmotionWrap1();
                      } else if (selectedEmotion == 1) {
                        return EmotionWrap2();
                      } else if (selectedEmotion == 2) {
                        return EmotionWrap3();
                      } else if (selectedEmotion == 3) {
                        return EmotionWrap4();
                      } else if (selectedEmotion == 4) {
                        return EmotionWrap5();
                      } else if (selectedEmotion == 5) {
                        return EmotionWrap6();
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(
                    height: 250,
                  ),
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
