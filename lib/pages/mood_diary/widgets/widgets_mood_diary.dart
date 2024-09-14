import 'package:flutter/material.dart';
import 'package:testovoe1/theme/theme.dart';

String getCurrentDate() {
  final DateTime now = DateTime.now();
  final List<String> monthNames = [
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря',
  ];
  return '${now.day} ${monthNames[now.month - 1]} ${now.hour}:${now.minute.toString().padLeft(2, '0')}';
}

class SwitchMS extends StatefulWidget {
  final Function(bool) onSwitchChanged;

  const SwitchMS({super.key, required this.onSwitchChanged});

  @override
  State<SwitchMS> createState() => _SwitchMSState();
}

class _SwitchMSState extends State<SwitchMS> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
      child: Stack(
        children: _isSelected
            ? [
                Positioned(
                  left: (MediaQuery.of(context).size.width - 90) / 2 - 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = false;
                      });
                      widget.onSwitchChanged(false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 30,
                      width: (MediaQuery.of(context).size.width - 90) / 2 + 20,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/stats.png',
                              width: 15, height: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Статистика',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = true;
                      });
                      widget.onSwitchChanged(true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 30,
                      width: (MediaQuery.of(context).size.width - 90) / 2 + 20,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/diary.png',
                              width: 15, height: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Дневник настроения',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            : [
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = true;
                      });
                      widget.onSwitchChanged(true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 30,
                      width: (MediaQuery.of(context).size.width - 90) / 2 + 20,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/diary.png',
                              width: 15, height: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Дневник настроения',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 90) / 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = false;
                      });
                      widget.onSwitchChanged(false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 30,
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/stats.png',
                              width: 15, height: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Статистика',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}

class HorizontalCardList extends StatefulWidget {
  final ValueChanged<int> onEmotionSelected;

  const HorizontalCardList({super.key, required this.onEmotionSelected});

  @override
  _HorizontalCardListState createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<HorizontalCardList> {
  List<bool> _isSelected = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          String imageName = '';
          switch (index) {
            case 0:
              imageName = 'assets/images/radost.png';
              break;
            case 1:
              imageName = 'assets/images/strah.png';
              break;
            case 2:
              imageName = 'assets/images/beshenstvo.png';
              break;
            case 3:
              imageName = 'assets/images/grust.png';
              break;
            case 4:
              imageName = 'assets/images/spokoistvie.png';
              break;
            case 5:
              imageName = 'assets/images/sila.png';
              break;
          }
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected[index] = !_isSelected[index];
                });
                if (_isSelected[index]) {
                  widget.onEmotionSelected(index);
                } else {
                  widget.onEmotionSelected(-1);
                }
              },
              child: Container(
                width: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(76),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: _isSelected[index]
                      ? Border.all(color: orangeColor, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageName,
                    ),
                    Text(
                      (getCardText(index)),
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String getCardText(int index) {
    switch (index) {
      case 0:
        return 'Радость';
      case 1:
        return 'Страх';
      case 2:
        return 'Бешенство';
      case 3:
        return 'Грусть';
      case 4:
        return 'Спокойствие';
      case 5:
        return 'Сила';
      default:
        return '';
    }
  }
}

class SliderWidget1 extends StatefulWidget {
  const SliderWidget1({super.key});

  @override
  _SliderWidget1State createState() => _SliderWidget1State();
}

class _SliderWidget1State extends State<SliderWidget1> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 6,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  6,
                  (index) => Container(
                        width: 2,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      )),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 6,
              ),
            ),
            child: Slider(
              value: _sliderValue,
              min: 0,
              max: 5,
              label: '',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              activeColor: orangeColor,
              thumbColor: orangeColor,
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(1)),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -10),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Низкий',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'Высокий',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderWidget2 extends StatefulWidget {
  const SliderWidget2({super.key});

  @override
  _SliderWidget2State createState() => _SliderWidget2State();
}

class _SliderWidget2State extends State<SliderWidget2> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 6,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  6,
                  (index) => Container(
                        width: 2,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      )),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 6,
              ),
            ),
            child: Slider(
              value: _sliderValue,
              min: 0,
              max: 5,
              label: '',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              activeColor: orangeColor,
              thumbColor: orangeColor,
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(1)),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -10),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Неуверенность',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'Уверенность',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  const NotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        maxLines: 3,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}

class ButtonSave extends StatelessWidget {
  const ButtonSave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(69),
      ),
      child: Center(
        child: InkWell(
          onTap: () {},
          child: const Text(
            'Сохранить',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class EmotionWrap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer1('Возбуждение'),
        EmotionContainer1('Восторг'),
        EmotionContainer1('Игривость'),
        EmotionContainer1('Наслаждение'),
        EmotionContainer1('Очарование'),
        EmotionContainer1('Осознанность'),
        EmotionContainer1('Смелость'),
        EmotionContainer1('Удовольствие'),
        EmotionContainer1('Чувственность'),
        EmotionContainer1('Энергичность'),
        EmotionContainer1('Экстравагантность'),
      ],
    );
  }
}

class EmotionContainer1 extends StatefulWidget {
  final String emotion;

  EmotionContainer1(this.emotion);

  @override
  _EmotionContainer1State createState() => _EmotionContainer1State();
}

class _EmotionContainer1State extends State<EmotionContainer1> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EmotionWrap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer2('Тревога'),
        EmotionContainer2('Испуг'),
      ],
    );
  }
}

class EmotionContainer2 extends StatefulWidget {
  final String emotion;

  EmotionContainer2(this.emotion);

  @override
  _EmotionContainer2State createState() => _EmotionContainer2State();
}

class _EmotionContainer2State extends State<EmotionContainer2> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EmotionWrap3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer3('Злость'),
        EmotionContainer3('Агрессия'),
      ],
    );
  }
}

class EmotionContainer3 extends StatefulWidget {
  final String emotion;

  EmotionContainer3(this.emotion);

  @override
  _EmotionContainer3State createState() => _EmotionContainer3State();
}

class _EmotionContainer3State extends State<EmotionContainer3> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EmotionWrap4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer4('Депрессия'),
        EmotionContainer4('Печаль'),
        EmotionContainer4('Тоска'),
      ],
    );
  }
}

class EmotionContainer4 extends StatefulWidget {
  final String emotion;

  EmotionContainer4(this.emotion);

  @override
  _EmotionContainer4State createState() => _EmotionContainer4State();
}

class _EmotionContainer4State extends State<EmotionContainer4> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EmotionWrap5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer5('Умиротворение'),
        EmotionContainer5('Покой'),
      ],
    );
  }
}

class EmotionContainer5 extends StatefulWidget {
  final String emotion;

  EmotionContainer5(this.emotion);

  @override
  _EmotionContainer5State createState() => _EmotionContainer5State();
}

class _EmotionContainer5State extends State<EmotionContainer5> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EmotionWrap6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        EmotionContainer6('Уверенность'),
        EmotionContainer6('Мощь'),
      ],
    );
  }
}

class EmotionContainer6 extends StatefulWidget {
  final String emotion;

  EmotionContainer6(this.emotion);

  @override
  _EmotionContainer6State createState() => _EmotionContainer6State();
}

class _EmotionContainer6State extends State<EmotionContainer6> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          widget.emotion,
          style: TextStyle(
            fontSize: 11,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
