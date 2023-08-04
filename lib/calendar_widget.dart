library calendar_widget;

import 'package:calendar_controller/calendar_controller.dart';
import 'package:flutter/cupertino.dart';

class Calendar extends StatelessWidget {
  Calendar({
    super.key,
    required this.date,
    required this.startFromMonday
  });

  final DateTime date;
  final bool startFromMonday;

  final calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {

    calendarController.startFromMonday = startFromMonday;

    final calendarData = calendarController.build(date);
    final List<String> weekdayRow = startFromMonday ?
      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] :
      ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    print(calendarData);

    return CupertinoPageScaffold(

      child: Container(

        /*
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 18),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(191, 201, 199, 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        */
        alignment: Alignment.center,

        child: Stack(

          alignment: AlignmentDirectional.center,
          
          children: [

            Text(
              date.month.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(238, 238, 238, 0.8),
                fontSize: 76,
                fontWeight: FontWeight.w900,
              ),
            ),

            DefaultTextStyle(

              style: const TextStyle(
                height: 1,
                fontSize: 14.0,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              textAlign: TextAlign.center,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Table( // Wrapper for TableRow of weekdays.

                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(1.0),
                    },

                    children: [
                      TableRow(
                        children: weekdayRow.map(

                          (e) => Container(

                            height: 36.0,
                            alignment: AlignmentDirectional.bottomCenter,

                            child: Text(

                              e,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          )
                        ).toList()
                      ),
                    ]
                  ),

                  Table( // Wrapper for TableRows of month numbers.

                    border: const TableBorder( // Decoration of borders.
                      
                      horizontalInside: BorderSide(
                        color: Color.fromRGBO(221, 221, 221, 1),
                        width: 1.0,
                      ),
                      
                      verticalInside: BorderSide(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color.fromRGBO(221, 221, 221, 1),
                        width: 1.0,
                      ),
                    ),

                    columnWidths: const <int, TableColumnWidth>{ // Set column width.
                      0: FlexColumnWidth(1.0),
                    },

                    children: calendarData.map(

                      (e) => TableRow(

                        children: e.map(

                          (l) => Container(

                            height: 48.0,
                            alignment: AlignmentDirectional.center,
                            child: Text(l.toString()),
                          )
                        ).toList()
                      )
                    ).toList()
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}