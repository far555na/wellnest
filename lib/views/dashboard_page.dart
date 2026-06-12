import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: WellnestColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _WellnessHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionHeader(
                      title: "Today's Metric",
                      action: 'See All',
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),

                    const GridViewMetrics(),

                    const SizedBox(height: 40),

                    const _InsightCard(),

                    const SizedBox(height: 40),

                    _SectionHeader(
                      title: 'Family Check-in',
                      action: 'See All',
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),

                    const _FamilyMemberCard(
                      name: 'Mom',
                      active: 'Last active: 6m ago',
                      imageUrl:
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                    ),
                    const SizedBox(height: 16),

                    const _FamilyMemberCard(
                      name: 'Dad',
                      active: 'Last active: 2h ago',
                      imageUrl:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
                    ),
                    const SizedBox(height: 16),

                    const _FamilyMemberCard(
                      name: 'Sister',
                      active: 'Last active: 15m ago',
                      imageUrl:
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WellnessHeader extends StatelessWidget {
  const _WellnessHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64),
      decoration: const BoxDecoration(
        color: WellnestColors.primary,
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const Center(child: CircularScoreProgress(value: 0.78, score: 78)),
          const SizedBox(height: 32),
          Text(
            'Wellness Score',
            style: textTheme.headlineLarge?.copyWith(
              color: WellnestColors.onPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your activity is good, but your sleep\nis slightly lower than usual. Consider\nan earlier wind-down routine tonight.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: WellnestColors.onPrimary,
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _StatusPill(text: 'Active Day'),
              SizedBox(width: 12),
              _StatusPill(text: 'Needs Rest'),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularScoreProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final int score;

  const CircularScoreProgress({
    super.key,
    required this.value,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 12,
            backgroundColor: WellnestColors.onPrimary.withValues(alpha: 0.50),
            valueColor: const AlwaysStoppedAnimation<Color>(
              WellnestColors.onPrimary,
            ),
            strokeCap: StrokeCap.round,
          ),
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$score',
              style: textTheme.displayLarge?.copyWith(
                color: WellnestColors.onPrimary,
              ),
            ),
            // const SizedBox(height: 4),
            Text(
              '/ 100',
              style: textTheme.labelLarge?.copyWith(
                color: WellnestColors.onPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String text;

  const _StatusPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: WellnestColors.onPrimary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: WellnestColors.onPrimary),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback onTap;

  const _SectionHeader({
    required this.title,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: WellnestColors.onSurface,
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              action,
              style: textTheme.bodySmall?.copyWith(
                color: WellnestColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: WellnestColors.primary,
                decorationThickness: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GridViewMetrics extends StatelessWidget {
  const GridViewMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      // childAspectRatio: 1.08,
      children: const [
        _MetricCard(
          icon: Icons.directions_walk_rounded,
          color: WellnestColors.activity,
          backgroundColor: WellnestColors.activitySurface,
          title: '2,750',
          target: '/ 6,000',
          subtitle: 'Steps',
          percent: '74%',
          progress: 0.74,
        ),
        _MetricCard(
          icon: Icons.favorite_border_rounded,
          color: WellnestColors.heart,
          backgroundColor: WellnestColors.heartSurface,
          title: '82',
          target: ' bpm',
          subtitle: 'Heart Rate',
          percent: '',
          progress: 0.55,
          showHeartLine: true,
        ),
        _MetricCard(
          icon: Icons.nightlight_round,
          color: WellnestColors.sleep,
          backgroundColor: WellnestColors.sleepSurface,
          title: '6h 45m',
          target: '/ 8h',
          subtitle: 'Sleep',
          percent: '84%',
          progress: 0.84,
        ),
        _MetricCard(
          icon: Icons.water_drop_outlined,
          color: WellnestColors.hydration,
          backgroundColor: WellnestColors.hydrationSurface,
          title: '1.4',
          target: '/ 2.0 L',
          subtitle: 'Hydration',
          percent: '70%',
          progress: 0.70,
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String title;
  final String target;
  final String subtitle;
  final String percent;
  final double progress;
  final bool showHeartLine;

  const _MetricCard({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.title,
    required this.target,
    required this.subtitle,
    required this.percent,
    required this.progress,
    this.showHeartLine = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withValues(alpha: 0.18)),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: color,
                child: Icon(icon, size: 20, color: WellnestColors.onPrimary),
              ),
              const Spacer(),
              if (percent.isNotEmpty)
                Text(
                  percent,
                  style: textTheme.bodySmall?.copyWith(color: color),
                ),
            ],
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: textTheme.headlineSmall?.copyWith(
                    color: WellnestColors.onSurface,
                  ),
                ),
                TextSpan(
                  text: ' $target',
                  style: textTheme.bodySmall?.copyWith(
                    color: WellnestColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 2),
          Text(subtitle, style: textTheme.bodySmall?.copyWith(color: color)),
          const SizedBox(height: 12),
          if (showHeartLine)
            CustomPaint(
              size: const Size(double.infinity, 22),
              painter: _HeartLinePainter(color),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: color.withValues(alpha: 0.15),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeartLinePainter extends CustomPainter {
  final Color color;

  _HeartLinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.55)
      ..lineTo(size.width * 0.22, size.height * 0.55)
      ..lineTo(size.width * 0.30, size.height * 0.20)
      ..lineTo(size.width * 0.40, size.height * 0.85)
      ..lineTo(size.width * 0.52, size.height * 0.45)
      ..lineTo(size.width * 0.62, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.55);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _HeartLinePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.activitySurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: WellnestColors.activityContainerHighest),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: WellnestColors.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'Wellnest Insight',
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Your resting heart rate has been slightly lower this week. This is often a sign of improved cardiovascular fitness.',
            style: textTheme.bodySmall?.copyWith(
              color: WellnestColors.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WellnestColors.primary,
                foregroundColor: WellnestColors.surfaceContainerLowest,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              onPressed: () {},
              child: Text(
                'View Suggestions',
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.surfaceContainerLowest,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FamilyMemberCard extends StatelessWidget {
  final String name;
  final String active;
  final String imageUrl;

  const _FamilyMemberCard({
    required this.name,
    required this.active,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: WellnestColors.primaryContainer,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.bodyMedium?.copyWith(
                      color: WellnestColors.onSurface,
                    ),
                  ),
                  Text(
                    active,
                    style: textTheme.labelSmall?.copyWith(
                      color: WellnestColors.outline,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: _MiniMetricPill(
                  icon: Icons.directions_walk_rounded,
                  text: '4,200 steps',
                  color: WellnestColors.activity,
                  background: WellnestColors.activitySurface,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _MiniMetricPill(
                  icon: Icons.favorite_border_rounded,
                  text: '82 bpm',
                  color: WellnestColors.heart,
                  background: WellnestColors.heartSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(
                child: _MiniMetricPill(
                  icon: Icons.nightlight_round,
                  text: '5h 15m',
                  color: WellnestColors.sleep,
                  background: WellnestColors.sleepSurface,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _MiniMetricPill(
                  icon: Icons.water_drop_outlined,
                  text: '4.2L',
                  color: WellnestColors.hydration,
                  background: WellnestColors.hydrationSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniMetricPill extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color background;

  const _MiniMetricPill({
    required this.icon,
    required this.text,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 34,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: color,
            child: Icon(icon, size: 20, color: WellnestColors.onPrimary),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
