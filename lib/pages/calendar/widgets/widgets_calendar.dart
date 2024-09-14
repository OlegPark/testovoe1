import 'package:flutter/material.dart';

class DaysN extends StatelessWidget {
  const DaysN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Пн', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Вт', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Ср', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Чт', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Пт', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Сб', style: TextStyle(color: Colors.grey, fontSize: 12),),
        Text('Вс', style: TextStyle(color: Colors.grey, fontSize: 12),),
      ],
    );
  }
}