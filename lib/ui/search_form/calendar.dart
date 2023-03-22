import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:travesys_2/api/api.dart';

class HijriGregorianCalendar extends StatefulWidget {
  @override
  _HijriGregorianCalendarState createState() => _HijriGregorianCalendarState();
}

class _HijriGregorianCalendarState extends State<HijriGregorianCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  // late CalendarController _calendarController;
  late Map<DateTime, List> _events;
  late Map<DateTime, List> _hijriEvents;
  bool light = true;

  @override
  void initState() {
    super.initState();
    // _calendarController = CalendarController();
    _events = {};
    _hijriEvents = {};
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('TravelDates', style: TextStyle(fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getTravelDate(),
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              // elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black12),
                ),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  focusedDay: _focusedDay,
                  lastDay: DateTime(2101),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _rangeStart = null; // Important to clean those
                        _rangeEnd = null;
                        _rangeSelectionMode = RangeSelectionMode.toggledOff;
                      });
                    }
                  },
                  onRangeSelected: (start, end, focusedDay) {
                    setState(() {
                      _selectedDay = null;
                      _focusedDay = focusedDay;
                      _rangeStart = start;
                      _rangeEnd = end;
                      _rangeSelectionMode = RangeSelectionMode.toggledOn;
                    });
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, date) {
                      final hijriCalendar = HijriCalendar.fromDate(date);
                      final dateFormatter = DateFormat('MMMM, yyyy');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (light) ...{
                            Text(
                              hijriCalendar.toFormat("MMMM, yyyy"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          },
                          Text(
                            dateFormatter.format(date),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      );
                    },
                    // rangeStartBuilder: (context, day, focusedDay) {
                    //   final hijriCalendar = HijriCalendar.fromDate(day);
                    //   return Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       if (light) ...{
                    //         Text(
                    //           hijriCalendar.toFormat("dd"),
                    //           textAlign: TextAlign.center,
                    //           style: const TextStyle(fontSize: 12),
                    //         ),
                    //       },
                    //       Text(
                    //         '${day.day}',
                    //         style: const TextStyle(fontSize: 18),
                    //       ),
                    //     ],
                    //   );
                    // },
                    defaultBuilder: (context, date, events) {
                      final hijriCalendar = HijriCalendar.fromDate(date);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (light) ...{
                            Text(
                              hijriCalendar.toFormat("dd"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          },
                          Text(
                            '${date.day}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hijri Calendar',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: light,
                  activeColor: Colors.blueGrey,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
              ),
              onPressed: () {
                Api.instance.startDate = _rangeStart;
                Api.instance.endDate = _rangeEnd;

                Navigator.pop(context, _rangeStart);
              },
              child: const Text("Confirm"),
            ),
          ),
        ],
      ),
    );
  }

  String getTravelDate() {
    String travelDate = '';
    if (_rangeStart != null) {
      travelDate = '${_rangeStart?.day}/${_rangeStart?.month}';
    }
    if (_rangeEnd != null) {
      travelDate = '$travelDate -${_rangeStart?.day}/${_rangeStart?.month}';
    }
    return travelDate;
  }
}
