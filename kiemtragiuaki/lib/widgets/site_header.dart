import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

  void _go(BuildContext context, String? route) {
    if (route == null) return;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final links = <_NavItem>[
      const _NavItem('Content', '/content'),
      const _NavItem('About', '/about'),
    ];

    return Material(
      color: AppColors.bg,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 900;
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.bg,
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Row(
              children: [
                if (!wide)
                  IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu_rounded),
                    tooltip: 'Menu',
                    style: IconButton.styleFrom(foregroundColor: AppColors.text),
                  ),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/about'),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.btnDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'f',
                      style: TextStyle(
                        color: AppColors.bg,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                if (wide)
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 28,
                      runSpacing: 8,
                      children: links.map((e) {
                        final active = e.route != null && e.route == currentRoute;
                        return TextButton(
                          onPressed: () {
                            if (e.route != null) _go(context, e.route);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.text,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            e.label,
                            style: TextStyle(
                              fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.text.withValues(alpha: 0.9),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                else
                  const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.bgMuted,
                    foregroundColor: AppColors.text,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.btnDark,
                    foregroundColor: AppColors.bg,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Register', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.route);
  final String label;
  final String? route;
}
