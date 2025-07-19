import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15, // Increased elevation for a more "3D" effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.7), // Seed color with transparency
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.3), // Adding splash color for feedback
        highlightColor: Colors.white.withOpacity(0.1), // Adding highlight color for feedback
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.white, // Icon color to white
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color to white
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
