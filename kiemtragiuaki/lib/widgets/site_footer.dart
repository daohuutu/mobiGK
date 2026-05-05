import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final twoCol = constraints.maxWidth >= 880;
              final linkCols = constraints.maxWidth >= 560;

              final brand = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacementNamed(context, '/about'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 14,
                    runSpacing: 8,
                    children: ['X', 'IG', 'YT', 'in']
                        .map(
                          (s) => _SocialChip(label: s),
                        )
                        .toList(),
                  ),
                ],
              );

              final footerCols = Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FooterColumn(
                      title: 'Use cases',
                      links: const [
                        'UI design',
                        'UX design',
                        'Wireframing',
                        'Diagramming',
                        'Brainstorming',
                        'Online whiteboard',
                        'Team collaboration',
                      ],
                    ),
                  ),
                  Expanded(
                    child: _FooterColumn(
                      title: 'Explore',
                      links: const [
                        'Design',
                        'Prototyping',
                        'Development features',
                        'Design systems',
                        'Collaboration features',
                        'Design process',
                        'FigJam',
                      ],
                    ),
                  ),
                  Expanded(
                    child: _FooterColumn(
                      title: 'Resources',
                      links: const [
                        'Blog',
                        'Best practices',
                        'Colors',
                        'Color wheel',
                        'Support',
                        'Developers',
                        'Resource library',
                      ],
                      onBlogTap: () => Navigator.pushReplacementNamed(context, '/content'),
                    ),
                  ),
                ],
              );

              if (twoCol) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 200, child: brand),
                    const SizedBox(width: 40),
                    Expanded(child: linkCols ? footerCols : _stackLinkCols(context)),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  brand,
                  const SizedBox(height: 40),
                  linkCols ? footerCols : _stackLinkCols(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _stackLinkCols(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterColumn(
          title: 'Use cases',
          links: const [
            'UI design',
            'UX design',
            'Wireframing',
            'Diagramming',
            'Brainstorming',
            'Online whiteboard',
            'Team collaboration',
          ],
        ),
        const SizedBox(height: 32),
        _FooterColumn(
          title: 'Explore',
          links: const [
            'Design',
            'Prototyping',
            'Development features',
            'Design systems',
            'Collaboration features',
            'Design process',
            'FigJam',
          ],
        ),
        const SizedBox(height: 32),
        _FooterColumn(
          title: 'Resources',
          links: const [
            'Blog',
            'Best practices',
            'Colors',
            'Color wheel',
            'Support',
            'Developers',
            'Resource library',
          ],
          onBlogTap: () => Navigator.pushReplacementNamed(context, '/content'),
        ),
      ],
    );
  }
}

class _SocialChip extends StatelessWidget {
  const _SocialChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bg,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({
    required this.title,
    required this.links,
    this.onBlogTap,
  });

  final String title;
  final List<String> links;
  final VoidCallback? onBlogTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.06 * 13,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((text) {
          final isBlog = text == 'Blog';
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: isBlog && onBlogTap != null ? onBlogTap : () {},
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
