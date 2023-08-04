import 'package:flutter/cupertino.dart';
import './calendar_widget.dart' show Calendar;

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
      child: Center(
        child: Calendar(
          date: DateTime.now(),
          startFromMonday: false,
        )
      )
    );
  }
}