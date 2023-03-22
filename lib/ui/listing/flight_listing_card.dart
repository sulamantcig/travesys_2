import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travesys_2/model/listing/listing/flight_listing_model.dart';

class FlightListingCard extends StatelessWidget {
  final AirItineraries? airItinerary;
  FlightListingCard({
    super.key,
    required this.airItinerary,
  });

  String flightDepartureTime() {
    var time = airItinerary?.itineraries?.first.legs?.first.departureTime;
    var parsedDate = DateTime.parse(time!);
    var format = DateFormat('hh:mm');
    var parsedTime = format.format(parsedDate);
    return parsedTime;
  }

  String flightArrivalTime() {
    var time = airItinerary?.itineraries?.first.legs?.first.arrivalTime;
    var parsedDate = DateTime.parse(time!);
    var format = DateFormat('hh:mm');
    var parsedTime = format.format(parsedDate);
    return parsedTime;
  }

  String totalTime() {
    var departure = airItinerary?.itineraries?.first.legs?.first.departureTime;
    var arrival = airItinerary?.itineraries?.first.legs?.first.arrivalTime;
    var departureTime = DateTime.parse(departure!);
    var arrivalTime = DateTime.parse(arrival!);

    Duration difference = arrivalTime.difference(departureTime);
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;

    var time = ("${hours}h ${minutes}m");
    return time;
  }

  String totalPrice() {
    final totalPrice = airItinerary?.totalFormattedPrice;
    return '$totalPrice';
  }

  String priceCurrency() {
    final currency = airItinerary?.itineraries?.first.currency;
    return 'From $currency';
  }

  bool isRefundable() {
    return airItinerary?.itineraries?.first.nonRefundableIndicator
                ?.toLowerCase() ==
            'Refundable'
        ? true
        : false;
  }

  bool isNumberStopVisible() {
    var numberOfStops = airItinerary?.itineraries?.first.noOfStops ?? 0;
    if (numberOfStops > 0) {
      return true;
    }
    return false;
  }

  String numberStopValue() {
    return '${airItinerary?.itineraries?.first.noOfStops} Stop';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isRefundable()
                  ? Color.fromARGB(255, 33, 152, 37)
                  : Colors.black54,
            ),
            child: Text(
              isRefundable() ? 'Refundable' : 'Non Refunable',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    flightDepartureTime(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: const Icon(
                      Icons.flight,
                      color: Colors.black54,
                      size: 16.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    flightArrivalTime(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(255, 203, 137, 39),
                    ),
                    child: const Text(
                      '+1 Day',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              isNumberStopVisible()
                  ? Text(
                      numberStopValue(),
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    airItinerary?.itineraries?.first.legs?.first.origin
                            ?.airportCode ??
                        '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'to',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    airItinerary?.itineraries?.first.legs?.first.destination
                            ?.airportCode ??
                        '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                totalTime(),
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Flight details',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 195, 193, 193),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/travesys_icon.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 195, 193, 193),
                      ),
                    ),
                    child: Image.asset('assets/images/travesys_icon.png',
                        height: 30, width: 30),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    priceCurrency(),
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    totalPrice(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
