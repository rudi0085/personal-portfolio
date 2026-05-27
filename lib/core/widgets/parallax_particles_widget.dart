import 'dart:math' as math;
import 'package:flutter/material.dart';

class Particle {
  double x;
  double y;
  double vx;
  double vy;
  double size;
  double depth;
  Color color;
  double targetX; // Target position (mengikuti cursor)
  double targetY;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
    required this.depth,
    required this.color,
    this.targetX = 0,
    this.targetY = 0,
  });

  factory Particle.random(Size size, Color primaryColor) {
    final random = math.Random();
    return Particle(
      x: random.nextDouble() * size.width,
      y: random.nextDouble() * size.height,
      vx: (random.nextDouble() - 0.5) * 2,
      vy: (random.nextDouble() - 0.5) * 2,
      size: random.nextDouble() * 4 + 2,
      depth: random.nextDouble() * 0.7 + 0.3,
      color: primaryColor.withOpacity(random.nextDouble() * 0.6 + 0.2),
    );
  }

  void update(
    Size size, {
    Offset? cursorPosition,
    double attractionStrength = 0.5,
    bool isMouseActive = false,
  }) {
    final effectiveCursorPosition = isMouseActive && cursorPosition != null
        ? cursorPosition
        : Offset(size.width / 2, size.height / 2);

    targetX = effectiveCursorPosition.dx;
    targetY = effectiveCursorPosition.dy;

    vx += (targetX - x) * attractionStrength * depth;
    vy += (targetY - y) * attractionStrength * depth;

    // ✅ Naikkan random perturbation dari 0.3 jadi 0.8
    final random = math.Random();
    vx += (random.nextDouble() - 0.5) * 8;
    vy += (random.nextDouble() - 0.5) * 2;

    vx *= 0.92;
    vy *= 0.92;

    x += vx;
    y += vy;

    x = x.clamp(0.0, size.width);
    y = y.clamp(0.0, size.height);
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double time;
  final Offset? cursorPosition;
  final bool isMouseActive; // ✅ Tambah parameter ini

  ParticlePainter(
    this.particles,
    this.time,
    this.cursorPosition,
    this.isMouseActive, // ✅
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update(
        size,
        cursorPosition: cursorPosition,
        attractionStrength: 0.0005, // ✅ Turunkan dari 0.008 jadi 0.004
        isMouseActive: isMouseActive,
      );

      final parallaxOffset = time * particle.depth * 10;

      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x, particle.y + parallaxOffset),
        particle.size * (0.05 + particle.depth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) =>
      oldDelegate.time != time ||
      oldDelegate.cursorPosition != cursorPosition ||
      oldDelegate.isMouseActive != isMouseActive; // ✅
}

class ParallaxParticlesWidget extends StatefulWidget {
  final Color particleColor;
  final int particleCount;
  final bool followCursor; // ✅ Option untuk enable/disable

  const ParallaxParticlesWidget({
    Key? key,
    this.particleColor = Colors.blue,
    this.particleCount = 50,
    this.followCursor = true,
  }) : super(key: key);

  @override
  State<ParallaxParticlesWidget> createState() =>
      _ParallaxParticlesWidgetState();
}

class _ParallaxParticlesWidgetState extends State<ParallaxParticlesWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<Particle> particles = [];
  Offset _cursorPosition = Offset.zero;
  bool _isMouseActive = false; // ✅ Track mouse state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (particles.isEmpty) {
      final size = MediaQuery.of(context).size;
      particles = List.generate(
        widget.particleCount,
        (_) => Particle.random(size, widget.particleColor),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isMouseActive = true; // ✅ Mouse masuk
        });
      },
      onHover: (event) {
        setState(() {
          _cursorPosition = event.localPosition;
          _isMouseActive = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isMouseActive = false; // ✅ Mouse keluar
          _cursorPosition = Offset.zero;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: ParticlePainter(
              particles,
              _controller.value,
              widget.followCursor ? _cursorPosition : null,
              _isMouseActive && widget.followCursor, // ✅ Pass state
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}
