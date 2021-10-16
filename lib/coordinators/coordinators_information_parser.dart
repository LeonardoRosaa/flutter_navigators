import 'package:flutter/material.dart';
import 'package:study_navigator/coordinators/routes.dart';

class CoordinatorsInformationParser extends RouteInformationParser<AppPath> {
  @override
  Future<AppPath> parseRouteInformation(RouteInformation routeInformation) async {
    final location = routeInformation.location;

    if (location != null) {
      return parseRoute(location);
    }

    throw '`RouterInformation.location` should never be null';
  }

  @override
  RouteInformation? restoreRouteInformation(AppPath configuration) => RouteInformation(location: configuration.formattedPath);
  
}