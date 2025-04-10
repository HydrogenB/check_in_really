import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/check_in_bloc.dart';
import '../widgets/progress_indicator_widget.dart';
import '../design_system/components/check_in_button.dart'; // Updated import path
import '../design_system/components/notification_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In Really'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings
            },
          ),
        ],
      ),
      body: BlocListener<CheckInBloc, CheckInState>(
        listener: (context, state) {
          if (state is CheckInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is CheckInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Congratulations! ${state.achievementTitle}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const NotificationCard(
                type: NotificationType.info,
                title: 'Welcome!',
                message: 'Find a check-in point to get started.',
              ),
              const SizedBox(height: 16),
              CheckInButton(
                onPressed: () {
                  // Handle check-in
                },
                isEnabled: true,
                label: 'Check In Now',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/achievements');
                },
                child: const Text('View Achievements'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
