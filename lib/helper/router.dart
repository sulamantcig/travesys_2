import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travesys_2/ui/listing/flight_listing_view.dart';
import 'package:travesys_2/ui/search_form/search_form_view.dart';

class CustomRouterConfig {
  static final CustomRouterConfig _singleton = CustomRouterConfig._internal();
  static CustomRouterConfig get instance => _singleton;

  factory CustomRouterConfig() {
    return _singleton;
  }

  CustomRouterConfig._internal();
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchFormView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'flight_listing',
            builder: (BuildContext context, GoRouterState state) {
              return const FlightListingView();
            },
          ),
        ],
      ),
    ],
  );
}
