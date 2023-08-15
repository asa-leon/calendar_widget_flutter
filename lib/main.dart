import 'package:flutter/cupertino.dart';
import './calendar_widget.dart' show CalendarWidget;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(),
      home: HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffold();
}

class _HomeScaffold extends State<HomeScaffold> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      child: Column(
      
        children: [

          Container(
            
            padding: const EdgeInsets.all(20),

            child: CalendarWidget(
              date: DateTime.now(),
              startFromMonday: false,
              weekdayTextSize: 15.0,
              dayNumbersFontSize: 18.0,
              dayNumbersVerticalPadding: 25,
            )
          )
        ]
      )
    );
  }
}