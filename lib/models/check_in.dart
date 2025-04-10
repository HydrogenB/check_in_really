import 'package:equatable/equatable.dart';

class CheckIn extends Equatable {
  final String locationName;
  final String achievement;
  final DateTime timestamp;

  const CheckIn({
    required this.locationName,
    required this.achievement,
    required this.timestamp,
  });

  @override
  List<Object> get props => [locationName, achievement, timestamp];
}
