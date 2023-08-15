library calendar_widget;

import 'package:calendar_controller/calendar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  ContainerTest({
    super.key,
    required this.date,
    required this.startFromMonday,
    required this.weekdayTextSize,
    required this.dayNumbersFontSize,
    required this.dayNumbersVerticalPadding,
  });

  final DateTime date;
  final bool startFromMonday;
  final double weekdayTextSize;
  final double dayNumbersFontSize;
  final double dayNumbersVerticalPadding;

  final calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {

    calendarController.startFromMonday = startFromMonday;

    final calendarData = calendarController.build(date);
    final List<String> weekdayRow = startFromMonday ?
      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] :
      ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    print(calendarData);

    return Container(

      color: const Color.fromRGBO(191, 201, 199, 1),

      child: Stack(

        alignment: AlignmentDirectional.center,
        
        children: [

          Text(
            date.month.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(238, 238, 238, 0.7), 
              fontSize: 128,
              fontWeight: FontWeight.bold,
            ),
          ),
        
          Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Table( // Wrapper for TableRow of weekdays.
                
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1.0),
                },

                children: [
                  // Weekdays' Row
                  TableRow(
                    
                    children: weekdayRow.map(

                      (e) => Text(
                          e,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromRGBO(102, 102, 102, 1),
                            fontSize: weekdayTextSize
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

                // Day Numbers' Rows
                children: calendarData.map(

                  (e) => TableRow(

                    children: e.map(

                      (l) => Padding(

                        padding: EdgeInsets.fromLTRB(0, dayNumbersVerticalPadding, 0, dayNumbersVerticalPadding),

                        child: Text(
                            l.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromRGBO(51, 51, 51, 1),
                              fontSize: dayNumbersFontSize,
                              ),
                          ),
                      )  
                    ).toList()
                  )
                ).toList()
              ),
            ]
          ),
        ],
      )
    );
  }
}