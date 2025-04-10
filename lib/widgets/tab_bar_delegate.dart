import 'package:flutter/material.dart';
import '../design_system/index.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final String activeTab;
  final Function(String) onTabChanged;

  TabBarDelegate({
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _TabItem(
            label: 'Nearby',
            icon: Icons.location_on,
            isActive: activeTab == 'nearby',
            onTap: () => onTabChanged('nearby'),
          ),
          _TabItem(
            label: 'History',
            icon: Icons.history,
            isActive: activeTab == 'history',
            onTap: () => onTabChanged('history'),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) {
    return oldDelegate.activeTab != activeTab;
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? AppColors.primary : Colors.grey,
              ),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? AppColors.primary : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
