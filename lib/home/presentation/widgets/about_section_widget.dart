import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeProfile;
  late final Animation<Offset> _slideProfile;
  late final Animation<double> _fadeDetails;
  late final Animation<Offset> _slideDetails;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeProfile = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );
    _slideProfile =
        Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOutQuint),
          ),
        );

    _fadeDetails = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    );
    _slideDetails =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOutQuint),
          ),
        );

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1024),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 800;

              final profile = FadeTransition(
                opacity: _fadeProfile,
                child: SlideTransition(
                  position: _slideProfile,
                  child: _ProfilePanel(colorScheme: colorScheme),
                ),
              );

              final details = FadeTransition(
                opacity: _fadeDetails,
                child: SlideTransition(
                  position: _slideDetails,
                  child: _DetailsPanel(colorScheme: colorScheme),
                ),
              );

              return isNarrow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [profile, const SizedBox(height: 48), details],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 320, child: profile),
                        const SizedBox(width: 64),
                        Expanded(child: details),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _SaaSCard extends StatelessWidget {
  final Widget child;
  final ColorScheme colorScheme;

  const _SaaSCard({required this.child, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ProfilePanel extends StatelessWidget {
  const _ProfilePanel({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return _SaaSCard(
      colorScheme: colorScheme,
      child: Semantics(
        label: 'Profil Singkat',
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.surfaceContainerHighest,
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  width: 4,
                ),
                image: const DecorationImage(
                  // Ganti dengan URL/asset foto asli kamu nanti
                  image: NetworkImage('https://via.placeholder.com/200'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Rudi Wicaksono",
              style: AppTextStyle.headlineSmall.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Flutter Developer',
              style: AppTextStyle.titleMedium.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded, size: 18),
                label: const Text('Download CV'),
                style: FilledButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mail_outline, size: 18),
                label: const Text('Contact Me'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  const _DetailsPanel({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return _SaaSCard(
      colorScheme: colorScheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline, color: colorScheme.primary, size: 28),
              const SizedBox(width: 12),
              Text(
                'About Me',
                style: AppTextStyle.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SelectableText(
            'Saya seorang Flutter Developer yang berfokus membangun aplikasi responsif '
            'dengan arsitektur bersih (Clean Architecture). Berpengalaman dalam '
            'mengembangkan produk dari tahap konsepsi hingga rilis produksi di Android, iOS, maupun Web.',
            style: AppTextStyle.bodyLarge.copyWith(
              height: 1.6,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            'Selalu memprioritaskan kode yang mudah dipelihara, test-driven, dan memperhatikan aksesibilitas '
            'serta performa tinggi. Saat ini terbuka untuk kolaborasi.',
            style: AppTextStyle.bodyLarge.copyWith(
              height: 1.6,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
          const SizedBox(height: 32),

          Row(
            children: [
              Icon(Icons.code_rounded, color: colorScheme.primary, size: 28),
              const SizedBox(width: 12),
              Text(
                'Tech Stack',
                style: AppTextStyle.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: const [
              _SkillChip(label: 'Flutter'),
              _SkillChip(label: 'Dart'),
              _SkillChip(label: 'Riverpod'),
              _SkillChip(label: 'BLoC'),
              _SkillChip(label: 'Firebase'),
              _SkillChip(label: 'REST API'),
              _SkillChip(label: 'Git'),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
          const SizedBox(height: 32),

          Row(
            children: [
              Icon(
                Icons.work_outline_rounded,
                color: colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'Experience',
                style: AppTextStyle.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _TimelineItem(
            year: '2021 — Present',
            title: 'Freelance Mobile Developer',
            desc:
                'Mengembangkan aplikasi dan berkolaborasi dalam tim secara remote.',
          ),
          const SizedBox(height: 24),
          const _TimelineItem(
            year: '2019 — 2021',
            title: 'Frontend Developer',
            desc:
                'Berperan dalam UI/UX, integrasi API, serta pemeliharaan legacy app.',
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.bodyMedium.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.year,
    required this.title,
    required this.desc,
  });

  final String year;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 130,
          child: Text(
            year,
            style: AppTextStyle.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.titleMedium.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
