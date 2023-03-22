import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travesys_2/api/api.dart';
import 'package:go_router/go_router.dart';

import '../../model/airports/airports_model.dart';
import 'calendar.dart';

class SearchFormView extends StatefulWidget {
  const SearchFormView({super.key});

  @override
  State<SearchFormView> createState() => _SearchFormViewState();
}

class _SearchFormViewState extends State<SearchFormView> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final TextEditingController _originTextEditingController =
      TextEditingController();
  final TextEditingController _destinationTextEditingController =
      TextEditingController();
  final TextEditingController _departureDateEditingController =
      TextEditingController();
  final TextEditingController _arrivalDateEditingController =
      TextEditingController();

  DateTime? _selectedDate;
  AirPortModel? _currentOriginSelected;
  AirPortModel? _currentDepartureSelected;
  String? _currentSelectedValue;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        final format = DateFormat('dd-MMM-yyyy');
        controller.text = format.format(picked);
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text("Travesys"),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AirportWidgets(
                  originTextEditingController: _originTextEditingController,
                  destinationTextEditingController:
                      _destinationTextEditingController),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return HijriGregorianCalendar();
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Travel dates',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            getTravelDate(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Icon(Icons.calendar_month)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('here');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Passenger and Class',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            '1 Passenger, Guest',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                  ),
                  onPressed: () async {
                    final result = validation();
                    if (result.keys.first) {
                      // final flightListing =
                      //     Isolate.run(Api.instance.flightSearch);
                      // flightListing.
                      context.go('/flight_listing');
                    } else {
                      showSnack(result.values.first);
                    }
                  },
                  child: const Text("Search Flight"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnack(String title) {
    final snackbar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  String getTravelDate() {
    final dateFormatter = DateFormat('dd, MMM');
    String travelDate = dateFormatter.format(DateTime.now());
    if (Api.instance.startDate != null) {
      travelDate =
          dateFormatter.format(Api.instance.startDate ?? DateTime.now());
    }
    if (Api.instance.endDate != null) {
      travelDate =
          '$travelDate - ${dateFormatter.format(Api.instance.endDate ?? DateTime.now())}';
    }
    return travelDate;
  }

  Map<bool, String> validation() {
    if (Api.instance.origin == null) {
      return {false: "Please Select Origin"};
    }
    if (Api.instance.destination == null) {
      return {false: "Please Select Destination"};
    }
    if (Api.instance.startDate == null) {
      return {false: "Please Select Start Date"};
    }
    if (Api.instance.endDate == null) {
      return {false: "Please Select End Date"};
    }
    return {true: ''};
  }
}

class AirportWidgets extends StatelessWidget {
  const AirportWidgets({
    super.key,
    required TextEditingController originTextEditingController,
    required TextEditingController destinationTextEditingController,
  })  : _originTextEditingController = originTextEditingController,
        _destinationTextEditingController = destinationTextEditingController;

  final TextEditingController _originTextEditingController;
  final TextEditingController _destinationTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 10.0, bottom: 0.0),
                child: TypeAheadField<AirPortModel>(
                  hideOnEmpty: true,
                  textFieldConfiguration: TextFieldConfiguration(
                    maxLines: 2,
                    controller: _originTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'FROM',
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    if (pattern.isEmpty) {
                      Api.instance.origin = null;
                    }
                    var airports = await Api.instance.getAirportList(pattern);
                    if (Api.instance.destination != null) {
                      airports.removeWhere((element) =>
                          element.id == Api.instance.destination?.id);
                    }
                    return airports;
                  },
                  itemBuilder: (context, AirPortModel airport) {
                    return ListTile(
                      leading: const Icon(Icons.local_airport_sharp),
                      title: Text("${airport.code} - ${airport.name}"),
                    );
                  },
                  onSuggestionSelected: (AirPortModel airport) {
                    _originTextEditingController.text =
                        "${airport.code} - ${airport.name}";
                    Api.instance.origin = airport;
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 8.0,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                child: TypeAheadField<AirPortModel>(
                  hideOnEmpty: true,
                  textFieldConfiguration: TextFieldConfiguration(
                    maxLines: 2,
                    controller: _destinationTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'TO',
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    var airports = await Api.instance.getAirportList(pattern);
                    if (pattern.isEmpty) {
                      Api.instance.destination = null;
                    }
                    if (Api.instance.origin != null) {
                      airports.removeWhere(
                          (element) => element.id == Api.instance.origin?.id);
                    }
                    return airports;
                  },
                  itemBuilder: (context, AirPortModel airport) {
                    return ListTile(
                      leading: const Icon(Icons.local_airport_rounded),
                      title: Text("${airport.code} - ${airport.name}"),
                    );
                  },
                  onSuggestionSelected: (AirPortModel airport) {
                    _destinationTextEditingController.text =
                        "${airport.code} - ${airport.name}";
                    Api.instance.destination = airport;
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 8.0,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey),
              color: Colors.white),
          child: Icon(Icons.connecting_airports),
        ),
      ],
    );
  }
}
