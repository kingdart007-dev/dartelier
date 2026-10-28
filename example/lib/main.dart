import 'package:dartelier/dartelier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DartelierExampleApp());
}

class DartelierExampleApp extends StatefulWidget {
  const DartelierExampleApp({super.key});

  @override
  State<DartelierExampleApp> createState() => _DartelierExampleAppState();
}

class _DartelierExampleAppState extends State<DartelierExampleApp> {
  ThemeMode _themeMode = ThemeMode.system;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartelier UI Foundation',
      debugShowCheckedModeBanner: false,
      theme: DartelierTheme.light,
      darkTheme: DartelierTheme.dark,
      themeMode: _themeMode,
      home: Scaffold(
        body: AppPage(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'DARTELIER',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  DropdownButton<ThemeMode>(
                    value: _themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _themeMode = value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('System'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: DartelierSpacing.xl),
              Text(
                'Good design starts with good foundations.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: DartelierSpacing.xs),
              Text(
                'A small, customizable Flutter UI foundation. Explore the '
                'tokens, surfaces, and actions that are ready to use.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: DartelierSpacing.xl),
              const SectionHeader(
                title: 'Surfaces',
                subtitle: 'Low-noise containers with consistent spacing.',
              ),
              const SizedBox(height: DartelierSpacing.md),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A considered default',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: DartelierSpacing.xs),
                    const Text(
                      'Neutral colors, subtle borders, and no unnecessary '
                      'elevation. Customize the theme without fighting it.',
                    ),
                    const SizedBox(height: DartelierSpacing.md),
                    Text('Action count: $_counter'),
                    const SizedBox(height: DartelierSpacing.sm),
                    AppButton(
                      label: 'Try an interaction',
                      icon: Icons.touch_app_outlined,
                      expand: true,
                      onPressed: () => setState(() => _counter++),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DartelierSpacing.xl),
              const SectionHeader(
                title: 'Actions',
                subtitle: 'Three emphasis levels for clear hierarchy.',
              ),
              const SizedBox(height: DartelierSpacing.md),
              Wrap(
                spacing: DartelierSpacing.sm,
                runSpacing: DartelierSpacing.sm,
                children: [
                  AppButton(
                    label: 'Primary',
                    onPressed: () => _showMessage(context, 'Primary action'),
                  ),
                  AppButton(
                    label: 'Secondary',
                    variant: AppButtonVariant.secondary,
                    onPressed: () => _showMessage(context, 'Secondary action'),
                  ),
                  AppButton(
                    label: 'Tertiary',
                    variant: AppButtonVariant.tertiary,
                    onPressed: () => _showMessage(context, 'Tertiary action'),
                  ),
                ],
              ),
              const SizedBox(height: DartelierSpacing.xl),
              const SectionHeader(
                title: 'Empty state',
                subtitle: 'Clear messaging when there is nothing to show.',
              ),
              const SizedBox(height: DartelierSpacing.sm),
              const AppCard(
                child: EmptyState(
                  title: 'Nothing here yet',
                  description: 'When content arrives, it will appear here.',
                  icon: Icons.inbox_outlined,
                ),
              ),
              const SizedBox(height: DartelierSpacing.xl),
              Text(
                'Design tokens: 4 · 8 · 12 · 16 · 24 · 32 · 48',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
