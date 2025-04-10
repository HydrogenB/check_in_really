import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/location_service.dart';
import '../models/location_point.dart';
import '../models/check_in.dart';

// Events
abstract class CheckInEvent {
  const CheckInEvent();
}

class CheckInAttempted extends CheckInEvent {
  const CheckInAttempted();
}

// States
abstract class CheckInState {
  final List<LocationPoint> nearbyLocations;
  final List<CheckIn> checkInHistory;
  final List<String> completedLocations;

  const CheckInState({
    this.nearbyLocations = const [],
    this.checkInHistory = const [],
    this.completedLocations = const [],
  });
}

class CheckInInitial extends CheckInState {}

class CheckInLoading extends CheckInState {}

class CheckInSuccess extends CheckInState {
  final String achievement;
  final bool isAllCompleted;

  const CheckInSuccess({
    required this.achievement,
    required this.isAllCompleted,
    required List<LocationPoint> nearbyLocations,
    required List<CheckIn> checkInHistory,
    required List<String> completedLocations,
  }) : super(
          nearbyLocations: nearbyLocations,
          checkInHistory: checkInHistory,
          completedLocations: completedLocations,
        );
}

class CheckInFailure extends CheckInState {
  final String message;
  const CheckInFailure(this.message);
}

class LocationPermissionDenied extends CheckInState {}

// Bloc
class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  final LocationService locationService;
  final List<LocationPoint> _locations = [
    LocationPoint(
      id: 1,
      name: 'Location 1',
      latitude: 13.7563,
      longitude: 100.5018,
    ),
    LocationPoint(
      id: 2,
      name: 'Location 2',
      latitude: 13.7469,
      longitude: 100.5349,
    ),
    // Add more locations as needed
  ];

  CheckInBloc({required this.locationService}) : super(CheckInInitial()) {
    on<CheckInAttempted>(_onCheckInAttempted);
  }

  Future<void> _onCheckInAttempted(
    CheckInAttempted event,
    Emitter<CheckInState> emit,
  ) async {
    emit(CheckInLoading());
    try {
      // Check location permission
      final hasPermission = await locationService.checkLocationPermission();
      if (!hasPermission) {
        emit(LocationPermissionDenied());
        return;
      }

      // Get current location and calculate distances
      final nearbyLocations = await _updateLocationsWithDistance();
      final inRangeLocation = nearbyLocations.firstWhere(
        (loc) => loc.isInRange,
        orElse: () => throw LocationServiceException('No location in range'),
      );

      // Simulate API call to get achievement
      await Future.delayed(const Duration(milliseconds: 500));
      final achievement = 'Achievement for ${inRangeLocation.name}';

      // Update location as checked in
      final updatedLocations = nearbyLocations.map((loc) {
        if (loc.id == inRangeLocation.id) {
          return loc.copyWith(
            isCheckedIn: true,
            achievementTitle: achievement,
          );
        }
        return loc;
      }).toList();

      // Create check-in record
      final checkIn = CheckIn(
        locationName: inRangeLocation.name,
        achievement: achievement,
        timestamp: DateTime.now(),
      );

      final completedLocations = updatedLocations
          .where((loc) => loc.isCheckedIn)
          .map((loc) => loc.name)
          .toList();

      emit(CheckInSuccess(
        achievement: achievement,
        isAllCompleted: completedLocations.length == _locations.length,
        nearbyLocations: updatedLocations,
        checkInHistory: [checkIn],
        completedLocations: completedLocations,
      ));
    } catch (e) {
      emit(CheckInFailure(e.toString()));
    }
  }

  Future<List<LocationPoint>> _updateLocationsWithDistance() async {
    final updatedLocations = <LocationPoint>[];

    for (final location in _locations) {
      final distance = await locationService.getDistanceTo(
        location.latitude,
        location.longitude,
      );

      final isInRange = distance <= 50; // 50 meters radius

      // Calculate UI position (simplified)
      final angle = updatedLocations.length * (360 / _locations.length);
      final radius = 100.0;
      final x = 120 + radius * cos(angle * pi / 180);
      final y = 120 + radius * sin(angle * pi / 180);

      updatedLocations.add(location.copyWith(
        distance: distance,
        isInRange: isInRange,
        x: x,
        y: y,
      ));
    }

    return updatedLocations;
  }
}
