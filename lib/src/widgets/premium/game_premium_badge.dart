import 'package:flutter/material.dart';

/// Small gradient pill marking premium / PRO content. Icon + uppercase
/// label sit on a vertical gradient with a matching darker border and a
/// soft glow shadow in the badge color.
class GamePremiumBadge extends StatelessWidget {
  const GamePremiumBadge({
    this.label = 'PRO',
    this.icon = Icons.diamond,
    this.color = const Color(0xFFFFC107),
    this.darkColor = const Color(0xFFB78A00),
    super.key,
  });

  final String label;
  final IconData icon;
  final Color color;
  final Color darkColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color, darkColor],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: darkColor, width: 1.5),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFFFFFFF), size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
