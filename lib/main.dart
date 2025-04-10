import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'blocs/check_in_bloc.dart';
import 'services/location_service.dart';
import 'screens/home_screen.dart';
import 'design_system/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

Future<void> setupDependencies() async {
  final getIt = GetIt.instance;
  final locationService = LocationService();
  await locationService.initialize(); // Initialize location service
  getIt.registerSingleton<LocationService>(locationService);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CheckInBloc>(
          create: (context) => CheckInBloc(
            locationService: GetIt.instance<LocationService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Check In Really',
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
