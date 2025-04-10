import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/location_point.dart';
import '../services/location_service.dart';

// Events
abstract class CheckInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckInAttempted extends CheckInEvent {
  final LocationPoint location;
  CheckInAttempted(this.location);

  @override
  List<Object?> get props => [location];
}

// States
abstract class CheckInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckInInitial extends CheckInState {}
class CheckInLoading extends CheckInState {}
class CheckInSuccess extends CheckInState {
  final String achievementTitle;
  CheckInSuccess(this.achievementTitle);

  @override
  List<Object?> get props => [achievementTitle];
}
class CheckInFailure extends CheckInState {
  final String message;
  CheckInFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  final LocationService locationService;

  CheckInBloc({required this.locationService}) : super(CheckInInitial()) {
    on<CheckInAttempted>(_onCheckInAttempted);
  }

  Future<void> _onCheckInAttempted(
    CheckInAttempted event,
    Emitter<CheckInState> emit,
  ) async {
    emit(CheckInLoading());

    try {
      final hasPermission = await locationService.checkLocationPermission();
      if (!hasPermission) {
        emit(CheckInFailure('Location permission denied'));
        return;
      }

      final isInRange = await locationService.isWithinRange(
        event.location.latitude,
        event.location.longitude,
      );

      if (!isInRange) {
        emit(CheckInFailure('You are too far from the check-in point'));
        return;
      }

      // TODO: Make API call to get achievement
      emit(CheckInSuccess('Achievement Unlocked!'));
    } catch (e) {
      emit(CheckInFailure(e.toString()));
    }
  }
}