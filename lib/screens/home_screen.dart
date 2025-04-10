import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/check_in_bloc.dart';
import '../widgets/check_in_button.dart';
import '../widgets/location_status_card.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/notification_cards.dart';
import '../widgets/settings_drawer.dart';
import '../widgets/help_dialog.dart';
import '../widgets/tab_bar_delegate.dart';
import '../widgets/achievement_card.dart';
import '../design_system/index.dart';
import '../widgets/location_marker.dart';
import '../design_system/maps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String _activeTab = 'nearby';
  late final AnimationController _confettiController;
  final ValueNotifier<bool> _showConfetti = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _confettiController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _showConfetti.dispose();
    super.dispose();
  }

  void _handleCheckInAttempt(BuildContext context) {
    HapticFeedback.mediumImpact(); // Add haptic feedback
    final checkInBloc = context.read<CheckInBloc>();
    checkInBloc.add(const CheckInAttempted());
  }

  void _showSuccessNotification(BuildContext context, String achievement) {
    HapticFeedback.heavyImpact(); // Stronger feedback for success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SuccessNotification(
          title: 'Check-in Successful!',
          subtitle: 'You earned: $achievement',
          onDismiss: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 4),
        elevation: 0,
      ),
    );
  }

  void _showErrorNotification(BuildContext context, String message) {
    HapticFeedback.vibrate(); // Error feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ErrorNotification(
          title: 'Check-in Failed',
          message: message,
          onRetry: () => _handleCheckInAttempt(context),
          onDismiss: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 6),
        elevation: 0,
      ),
    );
  }

  void _showConfettiCelebration() {
    _showConfetti.value = true;
    _confettiController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        _showConfetti.value = false;
        _confettiController.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SettingsDrawer(),
      body: Stack(
        children: [
          BlocConsumer<CheckInBloc, CheckInState>(
            listener: (context, state) {
              if (state is CheckInSuccess) {
                _showSuccessNotification(context, state.achievement);
                if (state.isAllCompleted) {
                  _showConfettiCelebration();
                }
              } else if (state is CheckInFailure) {
                _showErrorNotification(context, state.message);
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                physics: state is CheckInLoading
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _buildAppBar(state),
                  _buildTabBar(),
                  if (state is CheckInLoading)
                    const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state is LocationPermissionDenied)
                    SliverFillRemaining(
                      child: _buildPermissionRequest(),
                    )
                  else
                    _buildMainContent(state),
                ],
              );
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showConfetti,
            builder: (context, showConfetti, _) {
              if (!showConfetti) return const SizedBox.shrink();
              return IgnorePointer(
                child: ConfettiAnimation(
                  controller: _confettiController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(CheckInState state) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () => showDialog(
            context: context,
            builder: (_) => const HelpDialog(),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Check In Really',
                  style: AppTypography.headline2.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                ProgressIndicatorWidget(
                  total: 7,
                  completed: state.completedLocations.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TabBarDelegate(
        activeTab: _activeTab,
        onTabChanged: (tab) => setState(() => _activeTab = tab),
      ),
    );
  }

  Widget _buildMainContent(CheckInState state) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.md),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          if (_activeTab == 'nearby') ...[
            Stack(
              alignment: Alignment.center,
              children: [
                const RadarWidget(size: 240),
                if (state.nearbyLocations.isNotEmpty)
                  ...state.nearbyLocations.map(
                    (location) => Positioned(
                      left: location.x,
                      top: location.y,
                      child: LocationMarker(
                        isInRange: location.isInRange,
                        isCheckedIn: location.isCheckedIn,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.nearbyLocations.isEmpty
                  ? Center(
                      child: Text(
                        'No locations nearby',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.onSurface.withOpacity(0.6),
                        ),
                      ),
                    )
                  : Column(
                      children: state.nearbyLocations
                          .map(
                            (location) => Padding(
                              padding:
                                  const EdgeInsets.only(bottom: AppSpacing.md),
                              child: LocationStatusCard(
                                name: location.name,
                                distance: location.distance,
                                isInRange: location.isInRange,
                                isCheckedIn: location.isCheckedIn,
                                achievementTitle: location.achievementTitle,
                                onTap: location.isInRange
                                    ? () => _handleCheckInAttempt(context)
                                    : null,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
            if (state.nearbyLocations.any((l) => l.isInRange))
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: PulsingButton(
                  child: CheckInButton(
                    isLoading: state is CheckInLoading,
                    enabled: true,
                    onPressed: () => _handleCheckInAttempt(context),
                  ),
                ),
              ),
          ] else ...[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.checkInHistory.isEmpty
                  ? Center(
                      child: Text(
                        'No check-ins yet',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.onSurface.withOpacity(0.6),
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.checkInHistory.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final checkIn = state.checkInHistory[index];
                        return AchievementCard(
                          title: checkIn.locationName,
                          subtitle: checkIn.achievement,
                          isCompleted: true,
                        );
                      },
                    ),
            ),
          ],
        ]),
      ),
    );
  }

  Widget _buildPermissionRequest() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_off,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'Location Permission Required',
            style: AppTypography.headline3,
          ),
          const SizedBox(height: 8),
          Text(
            'We need location access to check you in at event points',
            style: AppTypography.body2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final checkInBloc = context.read<CheckInBloc>();
              checkInBloc.add(const CheckInAttempted());
            },
            child: const Text('Grant Permission'),
          ),
        ],
      ),
    );
  }
}
