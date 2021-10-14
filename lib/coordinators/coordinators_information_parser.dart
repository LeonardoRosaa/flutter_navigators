import 'package:flutter/material.dart';
import 'package:study_navigator/coordinators/app_routes.dart';

class CoordinatorsInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final location = routeInformation.location;

    if (location != null) {
      return parseRoute(location);
    }

    throw '`RouterInformation.location` should never be null';
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) => RouteInformation(location: configuration.formattedPath);
  
}