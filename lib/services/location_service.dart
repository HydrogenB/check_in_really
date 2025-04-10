import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static const double _acceptableDistance = 50; // meters

  Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  Future<bool> isWithinRange(double targetLat, double targetLng) async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLat,
        targetLng,
      );

      return distance <= _acceptableDistance;
    } catch (e) {
      return false;
    }
  }
}