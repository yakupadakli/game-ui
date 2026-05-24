import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shared documentation-style layout for example pages.
abstract final class DocTheme {
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE5E9F0);
  static const Color appBarBg = Color(0xFFECEFF4);

  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A1A1A),
    height: 1.25,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A1A1A),
    height: 1.3,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: Color(0xFF5A6470),
  );

  static const TextStyle code = TextStyle(
    fontSize: 13,
    height: 1.45,
    fontFamily: 'monospace',
    color: Color(0xFF2D3748),
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.4,
    color: Color(0xFF8B95A5),
  );
}

/// Constrains content width for readable doc columns.
class DocPageBody extends StatelessWidget {
  const DocPageBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: child,
        ),
      ),
    );
  }
}

/// Title + optional subtitle + intro body for a doc page header.
class DocIntro extends StatelessWidget {
  const DocIntro({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
  });

  final String title;
  final String? subtitle;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DocTheme.titleLarge),
        if (subtitle != null) ...[
          const SizedBox(height: 6),
          Text(subtitle!, style: DocTheme.caption),
        ],
        const SizedBox(height: 14),
        Text(body, style: DocTheme.body),
      ],
    );
  }
}

/// Bordered block with title and optional description, like a docs section.
class DocSection extends StatelessWidget {
  const DocSection({
    super.key,
    required this.title,
    this.description,
    required this.child,
  });

  final String title;
  final String? description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: DocTheme.sectionTitle),
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(description!, style: DocTheme.body),
          ],
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: DocTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DocTheme.border),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Inline code snippet with copy-to-clipboard.
class DocCode extends StatelessWidget {
  const DocCode(this.text, {super.key});

  final String text;

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 12, right: 4, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF0F4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DocTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SelectableText(text, style: DocTheme.code)),
          Tooltip(
            message: 'Copy',
            child: IconButton(
              onPressed: () => _copy(context),
              icon: const Icon(Icons.copy_rounded, size: 20),
              color: const Color(0xFF5A6470),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ),
        ],
      ),
    );
  }
}
