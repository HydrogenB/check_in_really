import 'package:equatable/equatable.dart';

class LocationPoint extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final bool isCheckedIn;
  final String? achievementTitle;

  const LocationPoint({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.isCheckedIn = false,
    this.achievementTitle,
  });

  LocationPoint copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    bool? isCheckedIn,
    String? achievementTitle,
  }) {
    return LocationPoint(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      achievementTitle: achievementTitle ?? this.achievementTitle,
    );
  }

  @override
  List<Object?> get props => [id, name, latitude, longitude, isCheckedIn, achievementTitle];
}