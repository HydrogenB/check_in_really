import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// DesignSystemShowcase is a widget that demonstrates the design system
/// of the Check In Really app. It shows typography, colors, buttons,
/// components, navigation, forms, map elements, animations, and guidelines.
class DesignSystemShowcase extends StatefulWidget {
  const DesignSystemShowcase({Key? key}) : super(key: key);

  @override
  State<DesignSystemShowcase> createState() => _DesignSystemShowcaseState();
}

class _DesignSystemShowcaseState extends State<DesignSystemShowcase> {
  String _activeTab = 'typography';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            backgroundColor: const Color(0xFFE00000),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check In Really - Design System',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Component library and style guide',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
            pinned: true,
            expandedHeight: 80,
          ),

          // Tab Navigation
          SliverPersistentHeader(
            delegate: _TabBarDelegate(
              activeTab: _activeTab,
              onTabChanged: (tab) {
                setState(() {
                  _activeTab = tab;
                });
              },
            ),
            pinned: true,
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: _buildTabContent(),
              ),
            ),
          ),
        ],
      ),
      // Footer
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Check In Really v1.0 - Design System',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              '© 2025 Company',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case 'typography':
        return _buildTypographySection();
      case 'colors':
        return _buildColorsSection();
      case 'buttons':
        return _buildButtonsSection();
      case 'components':
        return _buildComponentsSection();
      case 'navigation':
        return _buildNavigationSection();
      case 'forms':
        return _buildFormsSection();
      case 'map':
        return _buildMapSection();
      case 'animation':
        return _buildAnimationSection();
      case 'guidelines':
        return _buildGuidelinesSection();
      default:
        return _buildTypographySection();
    }
  }

  Widget _buildTypographySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Typography',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Headings
        _buildSectionCard(
          title: 'Headings',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTypographyItem(
                text: 'Heading 1',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1E),
                ),
                description: 'Screen titles (3xl)',
              ),
              const SizedBox(height: 12),
              _buildTypographyItem(
                text: 'Heading 2',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1E),
                ),
                description: 'Section headers (2xl)',
              ),
              const SizedBox(height: 12),
              _buildTypographyItem(
                text: 'Heading 3',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1E),
                ),
                description: 'Card titles (xl)',
              ),
              const SizedBox(height: 12),
              _buildTypographyItem(
                text: 'Heading 4',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1C1E),
                ),
                description: 'Sub-headers (lg)',
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Body Text
        _buildSectionCard(
          title: 'Body Text',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTypographyItem(
                text: 'Body text (base): Main content text',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 12),
              _buildTypographyItem(
                text: 'Small text (sm): Secondary information',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 12),
              _buildTypographyItem(
                text: 'Extra small (xs): Labels, captions',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Text Styles
        _buildSectionCard(
          title: 'Text Styles',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bold text for emphasis',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Medium weight for navigation',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Regular weight for body text',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypographyItem({
    required String text,
    required TextStyle style,
    String? description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: style),
        if (description != null)
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }

  Widget _buildColorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Colors',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildColorCard(
              color: const Color(0xFFE00000),
              name: 'Primary',
              code: 'tds/sys/light/primary #E00000',
            ),
            _buildColorCard(
              color: Colors.white,
              name: 'On Primary',
              code: 'tds/sys/light/on-primary #FFFFFF',
              hasBorder: true,
            ),
            _buildColorCard(
              color: const Color(0xFFF5DDDA),
              name: 'Surface Variant',
              code: 'tds/sys/light/surface-variant #F5DDDA',
            ),
            _buildColorCard(
              color: const Color(0xFFFF0000),
              name: 'Error',
              code: 'tds/ref/error/error50 #FF0000',
            ),
            _buildColorCard(
              color: Colors.white,
              name: 'Surface',
              code: 'tds/sys/light/surface #FFFFFF',
              hasBorder: true,
            ),
            _buildColorCard(
              color: const Color(0xFF1A1C1E),
              name: 'On Surface',
              code: 'tds/sys/light/on-surface #1A1C1E',
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorCard({
    required Color color,
    required String name,
    required String code,
    Color textColor = Colors.black,
    bool hasBorder = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: hasBorder ? Colors.grey.shade300 : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buttons',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Primary Buttons
        _buildSectionCard(
          title: 'Primary Buttons',
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE00000),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Primary Button',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE00000),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Disabled',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.check, size: 18),
                label: const Text(
                  'With Icon',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE00000),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Secondary Buttons
        _buildSectionCard(
          title: 'Secondary Buttons',
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE00000),
                  side: const BorderSide(
                    color: Color(0xFFE00000),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Secondary Button',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE00000),
                  side: const BorderSide(
                    color: Color(0xFFE00000),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Disabled',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Full-Width Buttons
        _buildSectionCard(
          title: 'Full-Width Buttons',
          content: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE00000),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Check In Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE00000),
                    side: const BorderSide(
                      color: Color(0xFFE00000),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'View All Achievements',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Icon Buttons
        _buildSectionCard(
          title: 'Icon Buttons',
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE00000),
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  minimumSize: const Size(48, 48),
                ),
                child: const Icon(Icons.check),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE00000),
                  side: const BorderSide(
                    color: Color(0xFFE00000),
                    width: 2,
                  ),
                  shape: const CircleBorder(),
                  minimumSize: const Size(48, 48),
                ),
                child: const Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.grey.shade700,
                  shape: const CircleBorder(),
                  minimumSize: const Size(48, 48),
                ),
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Check-In Buttons
        _buildSectionCard(
          title: 'Check-In Buttons',
          content: Column(
            children: [
              // Enabled Check-in
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  label: const Text(
                    'Check In Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE00000),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              // Disabled Check-in
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.location_on),
                  label: const Text(
                    'Too Far to Check In',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              // Pulsing Check-in
              Stack(
                children: [
                  _PulsingButton(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE00000),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        'You\'re Here! Tap to Check In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComponentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Components',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Achievement Cards
        _buildSectionCard(
          title: 'Achievement Cards',
          content: Column(
            children: [
              // Completed Achievement
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5DDDA),
                  border: Border.all(color: const Color(0xFFE00000)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE00000),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Main Office',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        const Text(
                          'Office Warrior',
                          style: TextStyle(
                            color: Color(0xFFE00000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Incomplete Achievement
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Downtown Branch',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Not checked in yet',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Progress Indicators
        _buildSectionCard(
          title: 'Progress Indicators',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dot Indicators
              const Text(
                'Progress Dots',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  final bool isCompleted = index < 3;
                  return Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isCompleted 
                          ? const Color(0xFFE00000) 
                          : Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: isCompleted
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          )
                        : null,
                  );
                }),
              ),
              const SizedBox(height: 24),
              
              // Progress Bar
              const Text(
                'Progress Bar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: 0.42,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFE00000),
                        ),
                        minHeight: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '3/7',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Loading Spinner
              const Text(
                'Loading Spinner',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  color: const Color(0xFFE00000),
                  backgroundColor: Colors.transparent,
                  strokeWidth: 4,
                ),
              ),
              const SizedBox(height: 24),
              
              // Achievement Wheel
              const Text(
                'Achievement Wheel',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 128,
                height: 128,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 0.42,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFE00000),
                      ),
                      strokeWidth: 10,
                    ),
                    const Text(
                      '3/7',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Notifications
        _buildSectionCard(
          title: 'Notifications',
          content: Column(
            children: [
              // Success Toast
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE00000),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Check-in successful!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'You unlocked: Office Warrior',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Error Message
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFFF0000)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFFF0000),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Location Error',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        const Text(
                          'You\'re too far from any check-in point',
                          style: TextStyle(
                            color: Color(0xFF1A1C1E),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Info Notification
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue.shade500,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'GPS Signal Weak',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        const Text(
                          'Try moving to an open area',
                          style: TextStyle(
                            color: Color(0xFF1A1C1E),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Permission Required
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  border: Border.all(color: Colors.yellow.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: Colors.yellow.shade700,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Location Permission Required',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1C1E),
                            ),
                          ),
                          const Text(
                            'Please enable location in settings',
                            style: TextStyle(
                              color: Color(0xFF1A1C1E),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE00000),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Enable Location',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Celebration Card
        _buildSectionCard(
          title: 'Celebration Card',
          content: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5DDDA),
              border: Border.all(color: const Color(0xFFE00000)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.emoji_events,
                  color: Color(0xFFE00000),
                  size: 48,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1E),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'You\'ve completed all check-ins!',
                  style: TextStyle(
                    color: Color(0xFF1A1C1E),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Location Status Cards
        _buildSectionCard(
          title: 'Location Status Cards',
          content: Column(
            children: [
              // In Range
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'You\'re Here!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Tap the button to check in',
                          style: TextStyle(
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Out of Range
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.grey.shade500,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Too Far Away',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Move closer to check in (250m away)',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // GPS Off
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  border: Border.all(color: Colors.yellow.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade500,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.wifi,
                            color: Colors.white,
                            size: 20,
                          ),
                          Transform.rotate(
                            angle: -0.4,
                            child: Container(
                              width: 20,
                              height: 2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'GPS Disabled',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Enable location services to check in',
                          style: TextStyle(
                            color: Colors.yellow.shade800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Navigation',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Headers
        _buildSectionCard(
          title: 'Headers',
          content: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  overflow: Clip.antiAlias,
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xFFE00000),
                      width: double.infinity,
                      child: const Text(
                        'Check In Really',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  overflow: Clip.antiAlias,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xFFE00000),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Achievements',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Bottom Navigation Bar
        _buildSectionCard(
          title: 'Bottom Navigation Bar',
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              overflow: Clip.antiAlias,
            ),
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(
                    icon: Icons.home,
                    label: 'Home',
                    isActive: true,
                  ),
                  _buildBottomNavItem(
                    icon: Icons.emoji_events,
                    label: 'Achievements',
                  ),
                  _buildBottomNavItem(
                    icon: Icons.map,
                    label: 'Check In',
                  ),
                  _buildBottomNavItem(
                    icon: Icons.settings,
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Tab Navigation
        _buildSectionCard(
          title: 'Tab Navigation',
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              overflow: Clip.antiAlias,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE00000),
                                width: 2,
                              ),
                            ),
                          ),
                          child: const Text(
                            'All Locations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFE00000),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Completed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Remaining',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Tab content would appear here',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Back Button
        _buildSectionCard(
          title: 'Back Button',
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(color: Colors.grey.shade200),
                  foregroundColor: Colors.black87,
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 16,
                ),
                label: const Text('Back'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive 
              ? const Color(0xFFE00000) 
              : Colors.grey.shade500,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive 
                ? const Color(0xFFE00000) 
                : Colors.grey.shade500,
          ),
        ),
      ],
    );
  }

  Widget _buildFormsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Forms',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Input Fields
        _buildSectionCard(
          title: 'Input Fields',
          content: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee ID',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your employee ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFFE00000),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'your.email@company.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFFE00000),
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Toggles & Switches
        _buildSectionCard(
          title: 'Toggles & Switches',
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Enable Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (_) {},
                    activeColor: const Color(0xFFE00000),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Background Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (_) {},
                    activeColor: const Color(0xFFE00000),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Permission Request
        _buildSectionCard(
          title: 'Permission Request',
          content: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: const Color(0xFFE00000),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Allow Location Access',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1E),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We use your location to check you in at event points!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Not Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE00000),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Allow',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Map Components',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Location Map
        _buildSectionCard(
          title: 'Location Map',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 256,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Icon(
                            Icons.map,
                            size: 40,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      // User location pin
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 - 8,
                        top: 256 / 2 - 8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 - 24,
                        top: 256 / 2 - 24,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      // Nearby check-in points
                      Positioned(
                        left: MediaQuery.of(context).size.width / 3,
                        top: 256 / 4,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE00000),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        right: MediaQuery.of(context).size.width / 4,
                        bottom: 256 / 3,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE00000),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade500,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Your location',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE00000),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Check-in points',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Location Radar
        _buildSectionCard(
          title: 'Location Radar',
          content: Container(
            height: 256,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: _RadarWidget(
                size: 192,
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Distance Indicators
        _buildSectionCard(
          title: 'Distance Indicators',
          content: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.gps_fixed,
                        color: const Color(0xFFE00000),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Downtown Office',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1C1E),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '120m away',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.gps_fixed,
                        color: const Color(0xFFE00000),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event Center',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1C1E),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.green.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'You\'re here! (15m)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Animation',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Check-In Animations
        _buildSectionCard(
          title: 'Check-In Animations',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Success Check Animation
              const Text(
                'Success Check',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: _SuccessCheckAnimation(
                  size: 64,
                ),
              ),
              const SizedBox(height: 24),
              
              // Confetti Animation
              const Text(
                'Confetti (All Complete)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFFCFCFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _ConfettiAnimation(),
              ),
              const SizedBox(height: 24),
              
              // Location Pulse
              const Text(
                'Location Pulse',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _LocationPulseAnimation(),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Loading & Transitions
        _buildSectionCard(
          title: 'Loading & Transitions',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // API Loading
              const Text(
                'API Loading',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        const Color(0xFFE00000),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Retrieving achievement...',
                    style: TextStyle(
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Achievement Reveal
              const Text(
                'Achievement Reveal',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _AchievementRevealAnimation(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGuidelinesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Design Guidelines',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        const SizedBox(height: 16),
        
        // Principles
        _buildSectionCard(
          title: 'Principles',
          content: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 20,
                      color: const Color(0xFFE00000),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Simple',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'One-tap check-in with minimal friction. Focus on the core experience.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      size: 20,
                      color: const Color(0xFFE00000),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Motivating',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Celebrate every achievement with animations and clear feedback.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.visibility,
                      size: 20,
                      color: const Color(0xFFE00000),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Visual',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'Clear map and visual progress tracking to guide the user.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.speed,
                      size: 20,
                      color: const Color(0xFFE00000),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Fast',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                        Text(
                          'API calls and check-ins should be quick with clear loading states.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Accessibility
        _buildSectionCard(
          title: 'Accessibility',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Touch Targets',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'All interactive elements should be at least 44×44 pixels.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Color Contrast',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Maintain WCAG 2.1 AA contrast ratio (4.5:1) for text.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Screen Readers',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Use proper labels and ARIA attributes for all interface elements.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alternatives',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Provide text alternatives for non-text content.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Spacing & Layout
        _buildSectionCard(
          title: 'Spacing & Layout',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(5, (index) {
                  final double padding = 8.0 * (index + 1);
                  return Expanded(
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '${(padding).toInt()}px',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Container Spacing',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Use 16px (padding) for container padding and 24px for section spacing.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Element Spacing',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Use 8px spacing between related elements and 16px between groups.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Touch Padding',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Allow 12px buffer space around interactive elements.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Error Handling
        _buildSectionCard(
          title: 'Error Handling',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Clear Messaging',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Error messages should clearly explain what went wrong and how to fix it.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fallbacks',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Have graceful fallbacks for network failures or GPS issues.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recovery Actions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  Text(
                    'Always provide a way forward with retry buttons or alternative actions.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C1E),
              ),
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final String activeTab;
  final Function(String) onTabChanged;

  _TabBarDelegate({
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
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTabButton(context, 'typography', 'Typography'),
            _buildTabButton(context, 'colors', 'Colors'),
            _buildTabButton(context, 'buttons', 'Buttons'),
            _buildTabButton(context, 'components', 'Components'),
            _buildTabButton(context, 'navigation', 'Navigation'),
            _buildTabButton(context, 'forms', 'Forms'),
            _buildTabButton(context, 'map', 'Map'),
            _buildTabButton(context, 'animation', 'Animation'),
            _buildTabButton(context, 'guidelines', 'Guidelines'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String tab, String label) {
    final bool isActive = activeTab == tab;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () => onTabChanged(tab),
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive 
              ? const Color(0xFFE00000)
              : Colors.grey.shade100,
          foregroundColor: isActive 
              ? Colors.white
              : Colors.grey.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return oldDelegate.activeTab != activeTab;
  }
}

class _PulsingButton extends StatefulWidget {
  final Widget child;

  const _PulsingButton({
    required this.child,
  });

  @override
  State<_PulsingButton> createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<_PulsingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE00000).withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SizedBox(
              height: 54,
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _RadarWidget extends StatefulWidget {
  final double size;

  const _RadarWidget({
    required this.size,
  });

  @override
  State<_RadarWidget> createState() => _RadarWidgetState();
}

class _RadarWidgetState extends State<_RadarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Concentric circles
          ...List.generate(4, (index) {
            final double circleSize = widget.size * (index + 1) / 4;
            return Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
            );
          }),
          
          // Center point
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
              shape: BoxShape.circle,
            ),
          ),
          
          // Check-in point
          Positioned(
            left: widget.size * 0.75,
            top: widget.size * 0.25,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFFE00000),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
          
          // Radar sweep
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _RadarSweepPainter(
                  angle: _controller.value * 2 * 3.14,
                  color: const Color(0xFFE00000),
                ),
                size: Size(widget.size, widget.size),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RadarSweepPainter extends CustomPainter {
  final double angle;
  final Color color;

  _RadarSweepPainter({
    required this.angle,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        angle,
        pi / 6,
        false,
      )
      ..close();
    
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          color.withOpacity(0.5),
          color.withOpacity(0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RadarSweepPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}

class _SuccessCheckAnimation extends StatefulWidget {
  final double size;

  const _SuccessCheckAnimation({
    required this.size,
  });

  @override
  State<_SuccessCheckAnimation> createState() => _SuccessCheckAnimationState();
}

class _SuccessCheckAnimationState extends State<_SuccessCheckAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.2),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 70,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();

    // Restart animation periodically
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  