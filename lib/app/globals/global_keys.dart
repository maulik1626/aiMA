import 'package:flutter/material.dart';

// Navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Define the RouteObserver globally
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();