import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/game_colors.dart';
import '../../core/game_disabled_overlay.dart';
import '../../core/game_gloss_surface.dart';
import '../../core/game_ui_strings_theme.dart';
import '../text/game_stroked_text.dart';
import 'game_toggle_palette.dart';

/// Glossy 3D pill toggle — a white shell around a recessed track, with a
/// candy-glossy knob that slides between the on (left) and off (right) sides.
/// The active side's label rides on the knob; the inactive label shows on the
/// track.
///
/// Controlled like Material's `Switch`: pass [value] and handle [onChanged]
/// (pass `null`, or set [enabled] to false, to disable). Tap, horizontal drag,
/// or keyboard (Space / Enter when focused) toggle it. All proportions and the
/// knob/track shading scale from [width].
class GameToggle extends StatefulWidget {
  const GameToggle({
    required this.value,
    required this.onChanged,
    this.width = 200,
    this.onLabel,
    this.offLabel,
    this.palette = GameTogglePalette.light,
    this.enabled = true,
    super.key,
  });

  /// Whether the toggle is on (knob on the left, [onLabel] showing).
  final bool value;

  /// Called with the new value when toggled. `null` disables interaction.
  final ValueChanged<bool>? onChanged;

  /// Overall pill width; height and all internal shading derive from it.
  final double width;

  /// Label for the on state. Defaults to the localized
  /// [GameUiStringsResolved.toggleOnLabel] (English `ON`).
  final String? onLabel;

  /// Label for the off state. Defaults to the localized
  /// [GameUiStringsResolved.toggleOffLabel] (English `OFF`).
  final String? offLabel;

  /// Color variation for the knob faces + labels. Defaults to
  /// [GameTogglePalette.light]; pass [GameTogglePalette.grey] for the earlier
  /// grey-off look, or a custom palette (e.g. `…light.copyWith(onColor: …)`).
  final GameTogglePalette palette;

  final bool enabled;

  @override
  State<GameToggle> createState() => _GameToggleState();
}

class _GameToggleState extends State<GameToggle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pos; // 0 = on (left), 1 = off (right)
  late final Animation<double> _fade; // eased, no overshoot
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 360),
      value: widget.value ? 0 : 1,
    );
    _pos = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeOutBack,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(GameToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      widget.value ? _controller.reverse() : _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _interactive => widget.enabled && widget.onChanged != null;

  void _toggle() => _setValue(!widget.value);

  void _setValue(bool next) {
    if (!_interactive || next == widget.value) return;
    HapticFeedback.lightImpact();
    widget.onChanged!(next);
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final k = w / 360; // scale factor from the source design
    final h = w * (176 / 360);
    final rim = 14 * k;

    final strings = context.gameUiStrings;
    final onLabel = widget.onLabel ?? strings.toggleOnLabel;
    final offLabel = widget.offLabel ?? strings.toggleOffLabel;
    final onColor = widget.palette.onColor;
    final offColor = widget.palette.offColor;

    return GameDisabledOverlay(
      disabled: !_interactive,
      child: FocusableActionDetector(
        enabled: _interactive,
        onShowFocusHighlight: (value) => setState(() => _focused = value),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              _toggle();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: _interactive ? _toggle : null,
          onHorizontalDragEnd: _interactive
              ? (details) {
                  final v = details.primaryVelocity ?? 0;
                  if (v.abs() < 1) return;
                  _setValue(v < 0); // drag left → on, right → off
                }
              : null,
          child: SizedBox(
            width: w,
            height: h,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final pos = _pos.value;
                final fade = _fade.value;
                final knobColor = Color.lerp(onColor, offColor, fade)!;
                final knobShadow = Color.lerp(
                  _dropShadow(onColor),
                  _dropShadow(offColor),
                  fade,
                )!;

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(h),
                    boxShadow: [
                      if (_focused)
                        BoxShadow(
                          color: GameColors.primary.withValues(alpha: 0.6),
                          blurRadius: 2 * k,
                          spreadRadius: 3 * k,
                        ),
                      BoxShadow(
                        color: const Color(0xFF96A5B9).withValues(alpha: 0.30),
                        blurRadius: 5 * k,
                        offset: Offset(0, 3 * k),
                      ),
                      BoxShadow(
                        color: const Color(0xFF94A4BA).withValues(alpha: 0.45),
                        blurRadius: 38 * k,
                        offset: Offset(0, 20 * k),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(rim),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Positioned.fill(child: _Track()),
                        // Track labels sit in the half the knob does NOT cover
                        // (the knob is wider than half the track), so long text
                        // fits clear of the knob instead of being clipped.
                        Positioned(
                          left: 16 * k,
                          top: 0,
                          bottom: 0,
                          width: 116 * k,
                          child: _trackLabel(onLabel, onColor, fade, k),
                        ),
                        Positioned(
                          right: 16 * k,
                          top: 0,
                          bottom: 0,
                          width: 116 * k,
                          child: _trackLabel(
                            offLabel,
                            const Color(0xFF8B9298),
                            1 - fade,
                            k,
                          ),
                        ),
                        Positioned(
                          top: 8 * k,
                          left: 8 * k + pos * (132 * k),
                          width: 184 * k,
                          height: (176 - 2 * 14 - 16) * k,
                          child: _knob(
                            knobColor,
                            knobShadow,
                            onLabel,
                            offLabel,
                            fade,
                            k,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _knob(
    Color faceColor,
    Color dropShadow,
    String onText,
    String offText,
    double fade,
    double k,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: dropShadow,
            blurRadius: 18 * k,
            offset: Offset(0, 10 * k),
          ),
        ],
      ),
      // Shared gloss chrome (same recipe as GameTileButton), shaped as a pill.
      child: GameGlossSurface(
        color: faceColor,
        borderRadius: BorderRadius.circular(999),
        referenceSize: 132 * k, // knob height: 176 - 2*14 - 16
        // Wide-but-short knob: a larger glint, nudged onto the rounded
        // top-left shoulder so it sits rather than clipping the top edge.
        highlightScale: 1.6,
        highlightOffset: const Offset(0.20, 0.16),
        edgeWidthScale: 2.6, // prominent inner border ring
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 184 * k * 0.12),
            // Scale long labels down so they never overflow the knob.
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Each label is styled for its own state and cross-fades;
                  // the off label stays readable on a light knob.
                  _knobText(
                    onText,
                    widget.palette.onLabelColor,
                    widget.palette.onColor,
                    1 - fade,
                    k,
                  ),
                  _knobText(
                    offText,
                    widget.palette.offLabelColor,
                    widget.palette.offColor,
                    fade,
                    k,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// A track label, centered in its clear-zone slot, faded by [opacity] and
  /// scaled down so long text fits.
  Widget _trackLabel(String text, Color color, double opacity, double k) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Opacity(
          opacity: opacity,
          child: GameStrokedText(
            text,
            color: color,
            // Soft white halo on the light track.
            strokeColor: const Color(0xCCFFFFFF),
            strokeWidth: 40 * k * 0.06,
            fontSize: 40 * k,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _knobText(
    String text,
    Color color,
    Color faceColor,
    double opacity,
    double k,
  ) {
    return Opacity(
      opacity: opacity,
      child: GameStrokedText(
        text,
        color: color,
        strokeColor: _labelStroke(color, faceColor),
        strokeWidth: 40 * k * 0.09,
        fontSize: 40 * k,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  /// Drop-shadow color derived from a knob face color.
  static Color _dropShadow(Color faceColor) =>
      GameColors.darken(faceColor, 0.24).withValues(alpha: 0.5);

  /// Stroke that adapts to the label's lightness: a dark outline under a light
  /// label, a white outline under a dark label (which vanishes into a light
  /// knob, leaving clean dark text).
  static Color _labelStroke(Color labelColor, Color faceColor) {
    return labelColor.computeLuminance() > 0.5
        ? GameColors.darken(faceColor, 0.34)
        : const Color(0xFFFFFFFF);
  }
}

/// Recessed light track with a real inset shadow (dark at the top inner edge,
/// light at the bottom) painted under a top→bottom gradient.
class _Track extends StatelessWidget {
  const _Track();

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(painter: _TrackPainter());
  }
}

class _TrackPainter extends CustomPainter {
  const _TrackPainter();

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFEDF1F4), Color(0xFFF4F7F9), Color(0xFFE6ECF1)],
    stops: [0.0, 0.5, 1.0],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(size.height / 2),
    );

    canvas.drawRRect(rrect, Paint()..shader = _gradient.createShader(rect));

    canvas.save();
    canvas.clipRRect(rrect);
    final blur = size.height * 0.12;
    // Dark inset shadow biting in from the top edge.
    _innerShadow(
      canvas,
      rrect,
      size,
      const Color(0xFF8595A8).withValues(alpha: 0.55),
      Offset(0, blur * 0.6),
      blur,
    );
    // Soft light catch along the bottom edge.
    _innerShadow(
      canvas,
      rrect,
      size,
      const Color(0xFFFFFFFF).withValues(alpha: 0.85),
      Offset(0, -blur * 0.5),
      blur * 0.8,
    );
    canvas.restore();
  }

  /// Casts a blurred shadow *inside* [rrect] from the edge nearest [shift]:
  /// fills everything outside the shifted shape, clipped to the real shape, so
  /// only the blur near that edge shows.
  void _innerShadow(
    Canvas canvas,
    RRect rrect,
    Size size,
    Color color,
    Offset shift,
    double blur,
  ) {
    final paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);
    final outer = Path()..addRect((Offset.zero & size).inflate(size.height));
    final inner = Path()..addRRect(rrect.shift(shift));
    canvas.drawPath(
      Path.combine(PathOperation.difference, outer, inner),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _TrackPainter oldDelegate) => false;
}
