import 'package:equatable/equatable.dart';

class LocationPoint extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final bool isCheckedIn;
  final String? achievementTitle;
  final double distance;
  final bool isInRange;
  final double x;
  final double y;

  const LocationPoint({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.isCheckedIn = false,
    this.achievementTitle,
    this.distance = double.infinity,
    this.isInRange = false,
    this.x = 0,
    this.y = 0,
  });

  LocationPoint copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    bool? isCheckedIn,
    String? achievementTitle,
    double? distance,
    bool? isInRange,
    double? x,
    double? y,
  }) {
    return LocationPoint(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      achievementTitle: achievementTitle ?? this.achievementTitle,
      distance: distance ?? this.distance,
      isInRange: isInRange ?? this.isInRange,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        latitude,
        longitude,
        isCheckedIn,
        achievementTitle,
        distance,
        isInRange,
        x,
        y,
      ];
}
