import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_color.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeDetails;
  late final Animation<Offset> _slideDetails;
  late final Animation<double> _fadeCta;
  late final Animation<Offset> _slideCta;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
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

    _fadeCta = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
    );
    _slideCta = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.55, 1.0, curve: Curves.easeOutQuint),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _fadeDetails,
                child: SlideTransition(
                  position: _slideDetails,
                  child: _DetailsPanel(colorScheme: colorScheme),
                ),
              ),
              const SizedBox(height: 24),
              FadeTransition(
                opacity: _fadeCta,
                child: SlideTransition(
                  position: _slideCta,
                  child: _CtaPanel(colorScheme: colorScheme),
                ),
              ),
            ],
          ),
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
    return Column(
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
          'I am a Flutter Developer focused on building responsive applications '
          'with clean architecture. I have experience developing products from '
          'concept to production release across Android, iOS, and the web.',
          style: AppTextStyle.bodyLarge.copyWith(
            height: 1.45,
            color: AppColors.primaryContainer,
          ),
        ),
        const SizedBox(height: 10),
        SelectableText(
          'I always prioritize maintainable, test-driven code with a strong focus '
          'on accessibility and performance. I am currently open to collaboration.',
          style: AppTextStyle.bodyLarge.copyWith(
            height: 1.45,
            color: AppColors.primaryContainer,
          ),
        ),
        const SizedBox(height: 20),
        Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
        const SizedBox(height: 20),

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
          runSpacing: 10,
          children: const [
            _SkillChip(label: 'Flutter'),
            _SkillChip(label: 'Dart'),
            _SkillChip(label: 'BLoC'),
            _SkillChip(label: 'Firebase'),
            _SkillChip(label: 'REST API'),
            _SkillChip(label: 'Git'),
            _SkillChip(label: 'Clean Architecture'),
          ],
        ),
        const SizedBox(height: 20),
        Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),

        const SizedBox(height: 20),

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
              'Developing applications and collaborating with teams remotely.',
        ),
        const SizedBox(height: 18),
        const _TimelineItem(
          year: '2019 — 2021',
          title: 'Frontend Developer',
          desc:
              'Worked on UI/UX, API integration, and maintaining legacy applications.',
        ),
      ],
    );
  }
}

class _CtaPanel extends StatelessWidget {
  const _CtaPanel({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
        const SizedBox(height: 18),
        Row(
          children: [
            Icon(Icons.send_outlined, color: colorScheme.primary, size: 24),
            const SizedBox(width: 12),
            Text(
              'Let’s Work Together',
              style: AppTextStyle.titleLarge.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'If you have a project idea or want to discuss a collaboration, feel free to reach out.',
          style: AppTextStyle.bodyLarge.copyWith(
            height: 1.45,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: [
            SizedBox(
              width: 180,
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
            SizedBox(
              width: 180,
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
      ],
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
