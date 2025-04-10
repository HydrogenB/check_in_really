import 'package:flutter/material.dart';
import 'colors.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final String activeTab;
  final Function(String) onTabChanged;

  TabBarDelegate({
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  double get minExtent => 48.0;

  @override
  double get maxExtent => 48.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab('Nearby', 'nearby'),
          _buildTab('History', 'history'),
        ],
      ),
    );
  }

  Widget _buildTab(String label, String value) {
    final isActive = activeTab == value;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () => onTabChanged(value),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          height: 48,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primary : Colors.grey[600],
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) {
    return oldDelegate.activeTab != activeTab;
  }
}

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const BottomNavigationItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? AppColors.primary : Colors.grey.shade500,
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? AppColors.primary : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
