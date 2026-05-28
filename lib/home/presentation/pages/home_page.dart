import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';
import 'package:portfolio_projct/core/widgets/appbar_header_widget.dart';
import 'package:portfolio_projct/core/widgets/parallax_particles_widget.dart';
import 'package:portfolio_projct/home/presentation/widgets/about_section_widget.dart';
import 'package:portfolio_projct/home/presentation/widgets/contact_section_widget.dart';
import 'package:portfolio_projct/home/presentation/widgets/projects_section_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.onThemeToggle});

  final VoidCallback onThemeToggle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onPageScroll);
  }

  void _onPageScroll() {
    setState(() {
      _page = _pageController.page ?? _pageController.initialPage.toDouble();
    });
  }

  Future<void> _onMenuTap(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(0, -_page * 40),
              child: ParallaxParticlesWidget(
                particleColor: colorScheme.primary,
                particleCount: 260,
                followCursor: true,
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
            children: [
              _HeroPage(page: _page, index: 0),
              _ParallaxPage(
                page: _page,
                index: 1,
                speed: 0.22,
                overlayColor: Colors.black.withValues(alpha: 0.22),
                background: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3A1C71),
                      Color(0xFFD76D77),
                      Color(0xFFFFAF7B),
                    ],
                  ),
                ),
                child: const AboutSection(),
              ),
              _ParallaxPage(
                page: _page,
                index: 2,
                speed: 0.18,
                overlayColor: Colors.black.withValues(alpha: 0.25),
                background: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF134E5E), Color(0xFF71B280)],
                  ),
                ),
                child: const ProjectsSection(),
              ),
              _ParallaxPage(
                page: _page,
                index: 3,
                speed: 0.14,
                overlayColor: Colors.black.withValues(alpha: 0.24),
                background: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF232526), Color(0xFF414345)],
                  ),
                ),
                child: const ContactSection(),
              ),
            ],
          ),
          SafeArea(
            bottom: false,
            child: Transform.translate(
              offset: Offset(0, -_page * 12),
              child: AppBarHeaderWidget(
                title: 'Portfolio',
                onThemeToggle: widget.onThemeToggle,
                onMenuTap: _onMenuTap,
                currentIndex: _page.round().clamp(0, 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPage extends StatelessWidget {
  const _HeroPage({required this.page, required this.index});

  final double page;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final delta = page - index;

    return SizedBox.expand(
      child: Center(
        child: Transform.translate(
          offset: Offset(0, delta * 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Welcome to my Portfolio!',
                  textStyle: AppTextStyle.displayLarge.copyWith(
                    color: colorScheme.primary,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
                ScaleAnimatedText(
                  'Explore my projects and experience.',
                  textStyle: AppTextStyle.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  duration: const Duration(milliseconds: 1800),
                ),
              ],
              repeatForever: true,
              displayFullTextOnTap: true,
            ),
          ),
        ),
      ),
    );
  }
}

class _ParallaxPage extends StatelessWidget {
  const _ParallaxPage({
    required this.page,
    required this.index,
    required this.speed,
    required this.background,
    required this.overlayColor,
    required this.child,
  });

  final double page;
  final int index;
  final double speed;
  final BoxDecoration background;
  final Color overlayColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final delta = page - index;

    return SizedBox.expand(
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.translate(
              offset: Offset(0, delta * 120 * speed),
              child: Container(decoration: background),
            ),
            Container(color: overlayColor),
            child,
          ],
        ),
      ),
    );
  }
}
