import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_drawer.dart';
import '../widgets/site_footer.dart';
import '../widgets/site_header.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: '/content'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SiteHeader(currentRoute: '/content')),
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.bgMuted,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Content',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.02 * 16,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Subtitle',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.textMuted,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 21 / 9,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFE5E7EB), Color(0xFFF3F4F6)],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Hero image',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textMuted,
                      ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Subtitle',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF374151),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Nguyên tắc',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Subtitle',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF374151),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Tóm lại',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Subtitle',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF374151),
                              height: 1.6,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.bgMuted,
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 64),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nội dung liên quan',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Thêm bài đọc ngắn.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 32),
                      LayoutBuilder(
                        builder: (context, c) {
                          final cols = c.maxWidth >= 900
                              ? 3
                              : c.maxWidth >= 560
                                  ? 2
                                  : 1;
                          final cards = [
                            ('UI', 'UX checklist'),
                            ('Design QA', 'Checklist'),
                            ('Accessibility', 'Checklist'),
                            ('Performance', 'Checklist'),
                            ('Security', 'Checklist'),
                            ('Internationalization', 'Checklist'),
                          ];
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: cols,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.95,
                            ),
                            itemCount: cards.length,
                            itemBuilder: (context, i) {
                              final (t, d) = cards[i];
                              return _RelatedCard(title: t, description: d);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SiteFooter()),
        ],
      ),
    );
  }
}

class _RelatedCard extends StatelessWidget {
  const _RelatedCard({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              color: AppColors.bgMuted,
              alignment: Alignment.center,
              child: Icon(Icons.image_outlined, size: 40, color: AppColors.textMuted.withValues(alpha: 0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
