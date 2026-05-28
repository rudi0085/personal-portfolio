import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_color.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _SectionHeader(
                icon: Icons.layers_outlined,
                title: 'Projects',
                subtitle:
                    'Selected work that combines product thinking, clean implementation, and polished UI.',
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 24),
              _FeaturedProjectSpotlight(
                colorScheme: colorScheme,
                projectName: 'Cashbaik',
                description:
                    'A cashback application that helps users earn rewards from marketplace transactions such as Shopee. The app is live at cashbaik.com and is also available on the App Store.',
                techStack: const [
                  'Flutter',
                  'Dart',
                  'Rewards',
                  'Marketplace Cashback',
                ],
                liveUrl: 'https://www.cashbaik.com/',
                storeLabel: 'Available on the App Store',
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 760;

                  final items = [
                    _ProjectListTile(
                      colorScheme: colorScheme,
                      title: 'E-Commerce Mobile App',
                      description:
                          'Mobile shopping experience with product browsing, cart flow, and API integration.',
                      techStack: const ['Flutter', 'REST API', 'Firebase'],
                    ),
                    _ProjectListTile(
                      colorScheme: colorScheme,
                      title: 'Analytics Dashboard',
                      description:
                          'A data-focused dashboard with clean hierarchy, charts, and quick insights for business users.',
                      techStack: const [
                        'Flutter Web',
                        'Charts',
                        'State Management',
                      ],
                    ),
                    _ProjectListTile(
                      colorScheme: colorScheme,
                      title: 'Task Management UI',
                      description:
                          'A productivity interface with task status, clean navigation, and a mobile-first layout.',
                      techStack: const [
                        'UI Design',
                        'Dart',
                        'Clean Architecture',
                      ],
                    ),
                  ];

                  if (isNarrow) {
                    return Column(
                      children: [
                        for (final item in items) ...[
                          item,
                          const SizedBox(height: 14),
                        ],
                      ],
                    );
                  }

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: items[0]),
                          const SizedBox(width: 14),
                          Expanded(child: items[1]),
                        ],
                      ),
                      const SizedBox(height: 14),
                      items[2],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colorScheme,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyle.headlineSmall.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: AppTextStyle.bodyLarge.copyWith(
            color: AppColors.primaryContainer,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FeaturedProjectSpotlight extends StatelessWidget {
  const _FeaturedProjectSpotlight({
    required this.colorScheme,
    required this.projectName,
    required this.description,
    required this.techStack,
    required this.liveUrl,
    required this.storeLabel,
  });

  final ColorScheme colorScheme;
  final String projectName;
  final String description;
  final List<String> techStack;
  final String liveUrl;
  final String storeLabel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 760;

        final preview = _CashbaikPreview(colorScheme: colorScheme);

        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Project',
              style: AppTextStyle.labelLarge.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              projectName,
              style: AppTextStyle.displaySmall.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: AppTextStyle.bodyLarge.copyWith(
                color: AppColors.primaryContainer,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: techStack
                  .map((tech) => _TechPill(label: tech))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _InlineLinkPill(
                  label: 'Live: cashbaik.com',
                  icon: Icons.public_rounded,
                  colorScheme: colorScheme,
                ),
                _InlineLinkPill(
                  label: storeLabel,
                  icon: Icons.apple_rounded,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ],
        );

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [preview, const SizedBox(height: 18), content],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 5, child: preview),
            const SizedBox(width: 22),
            Expanded(flex: 6, child: content),
          ],
        );
      },
    );
  }
}

class _CashbaikPreview extends StatelessWidget {
  const _CashbaikPreview({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 18, top: 18, bottom: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.22),
                    colorScheme.tertiary.withValues(alpha: 0.18),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cashbaik',
                      style: AppTextStyle.headlineSmall.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cashback rewards from marketplace transactions.',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: colorScheme.surface.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: colorScheme.outlineVariant.withValues(
                            alpha: 0.35,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Integrates cashback rewards from Shopee and other marketplaces.',
                                style: AppTextStyle.bodyMedium.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 2, top: 28, bottom: 28),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.62),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.35),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Live on the App Store',
                    style: AppTextStyle.labelLarge.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InlineLinkPill extends StatelessWidget {
  const _InlineLinkPill({
    required this.label,
    required this.icon,
    required this.colorScheme,
  });

  final String label;
  final IconData icon;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyle.bodySmall.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectListTile extends StatelessWidget {
  const _ProjectListTile({
    required this.colorScheme,
    required this.title,
    required this.description,
    required this.techStack,
  });

  final ColorScheme colorScheme;
  final String title;
  final String description;
  final List<String> techStack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.titleLarge.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: AppTextStyle.bodyMedium.copyWith(
              color: AppColors.primaryContainer,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techStack.map((tech) => _TechPill(label: tech)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TechPill extends StatelessWidget {
  const _TechPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.16)),
      ),
      child: Text(
        label,
        style: AppTextStyle.bodySmall.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
