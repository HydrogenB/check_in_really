import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static const double _acceptableDistance = 50; // meters

  Future<void> initialize() async {
    // Request location permission on initialization
    await checkLocationPermission();
    // Check if location services are enabled
    await _checkLocationServices();
  }

  Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  Future<void> _checkLocationServices() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceException('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationServiceException('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationServiceException(
        'Location permissions are permanently denied',
      );
    }
  }

  Future<Position> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      throw LocationServiceException('Failed to get current location: $e');
    }
  }

  Future<bool> isWithinRange(double targetLat, double targetLng) async {
    try {
      final position = await getCurrentPosition();
      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLat,
        targetLng,
      );

      return distance <= _acceptableDistance;
    } catch (e) {
      throw LocationServiceException('Location check failed: $e');
    }
  }

  Future<double> getDistanceTo(double targetLat, double targetLng) async {
    try {
      final position = await getCurrentPosition();
      return Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLat,
        targetLng,
      );
    } catch (e) {
      throw LocationServiceException('Distance calculation failed: $e');
    }
  }
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);

  @override
  String toString() => message;
}
