class LocationFlags {
  // Private constructor
  LocationFlags._();

  // Singleton instance variable
  static final LocationFlags _instance = LocationFlags._();

  // Factory constructor to access the singleton instance
  factory LocationFlags() => _instance;

  // Flags to store location permissions
  bool isLocationPermissionDeniedForever = false;
  bool isLocationAccuracyReduced = false;
  bool isLocationPermissionDenied = false;
}
