import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final items = <({String label, String? route})>[
      (label: 'Content', route: '/content'),
      (label: 'About', route: '/about'),
    ];

    return Drawer(
      backgroundColor: AppColors.bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Text('Menu', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            ),
            for (final e in items)
              ListTile(
                title: Text(e.label),
                selected: e.route != null && e.route == currentRoute,
                onTap: () {
                  Navigator.pop(context);
                  if (e.route != null) {
                    Navigator.pushReplacementNamed(context, e.route!);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
