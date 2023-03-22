import 'package:flutter/material.dart';
import 'package:travesys_2/model/listing/listing/flight_listing_model.dart';

import '../../api/api.dart';
import 'flight_listing_card.dart';

class FlightListingView extends StatefulWidget {
  const FlightListingView({super.key});

  @override
  State<FlightListingView> createState() => _FlightListingViewState();
}

class _FlightListingViewState extends State<FlightListingView> {
  bool isLoading = false;
  int page = 0;
  List<AirItineraries>? airItineraries;

  ListView createListView(List<AirItineraries>? airItineraries) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!isLoading) {
          isLoading = !isLoading;
          page += 1;
          Api.instance.flightSearch(page: page).then((value) => {
                if (value != null &&
                    value.airItineraries != null &&
                    value.airItineraries!.isNotEmpty)
                  {
                    airItineraries?.addAll(value.airItineraries!),
                    setState(() {})
                  }
              });
        }
      }
    });
    return ListView.builder(
      controller: scrollController,
      itemCount: airItineraries?.length,
      itemBuilder: (context, index) {
        return index == 1
            ? FlightListingCard(airItinerary: airItineraries?[index])
            : FlightListingCard(airItinerary: airItineraries?[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Travesys"),
        ),
      ),
      body: FutureBuilder(
        future: Api.instance.flightSearch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            final airItineraries = snapshot.data?.airItineraries;
            return createListView(airItineraries);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
