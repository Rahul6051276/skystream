import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/explore_language_provider.dart';

class LanguageSelectorDialog extends ConsumerStatefulWidget {
  const LanguageSelectorDialog({super.key});

  @override
  ConsumerState<LanguageSelectorDialog> createState() =>
      _LanguageSelectorDialogState();
}

class _LanguageSelectorDialogState
    extends ConsumerState<LanguageSelectorDialog> {
  late Set<String> tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = Set.from(ref.read(selectedLanguagesProvider));
  }

  void _toggleLanguage(String code) {
    setState(() {
      if (tempSelected.contains(code)) {
        if (tempSelected.length > 1) {
          tempSelected.remove(code);
        }
      } else {
        tempSelected.add(code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final languages = ref.watch(languageListProvider);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxHeight: 650, maxWidth: 550),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.dividerColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.translate,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Languages (${tempSelected.length} Selected)",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: theme.dividerColor),

              // Grid items
              Flexible(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = tempSelected.contains(lang.code);

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _toggleLanguage(lang.code),
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary.withValues(alpha: 0.2)
                                : theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.dividerColor,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.outline,
                                ),
                                child: Text(
                                  lang.code.split('-')[0].toUpperCase(),
                                  style: TextStyle(
                                    color: theme.colorScheme.onSurface,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  lang.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: isSelected
                                        ? theme.colorScheme.onSurface
                                        : theme.colorScheme.onSurfaceVariant,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: isSelected,
                                activeColor: theme.colorScheme.primary,
                                onChanged: (_) => _toggleLanguage(lang.code),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Divider(height: 1, color: theme.dividerColor),

              // Action Buttons (TV Friendly)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          tempSelected = {'hi-IN', 'en-US', 'pa-IN'};
                        });
                      },
                      child: const Text("Select Indian/Main"),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("Apply Filter"),
                      onPressed: () {
                        ref.read(selectedLanguagesProvider.notifier).state =
                            Set.from(tempSelected);
                        // Main language primary set kar do
                        if (tempSelected.isNotEmpty) {
                          ref
                              .read(languageProvider.notifier)
                              .setLanguage(tempSelected.first);
                        }
                        Navigator.of(context).pop();
                      },
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
