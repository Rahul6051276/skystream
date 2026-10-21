import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/storage/settings_repository.dart';

part 'explore_language_provider.g.dart';

@Riverpod(keepAlive: true)
class Language extends _$Language {
  @override
  String build() {
    final settings = ref.read(settingsRepositoryProvider);
    return settings.getExploreLanguage();
  }

  Future<void> setLanguage(String language) async {
    await ref.read(settingsRepositoryProvider).setExploreLanguage(language);
    state = language;
  }
}

// Multi-select languages provider (supports selecting multiple languages)
final selectedLanguagesProvider =
    StateNotifierProvider<SelectedLanguagesNotifier, Set<String>>((ref) {
  final current = ref.watch(languageProvider);
  return SelectedLanguagesNotifier({current});
});

class SelectedLanguagesNotifier extends StateNotifier<Set<String>> {
  SelectedLanguagesNotifier(super.state);

  void toggle(String code) {
    if (state.contains(code)) {
      if (state.length > 1) { // Kam se kam 1 language select rahe
        state = {...state}..remove(code);
      }
    } else {
      state = {...state, code};
    }
  }

  void selectAll(List<String> codes) {
    state = codes.toSet();
  }

  void reset(String defaultCode) {
    state = {defaultCode};
  }
}

class LanguageOption {
  final String code;
  final String name;
  final String nativeName;

  const LanguageOption(this.code, this.name, this.nativeName);
}

@Riverpod(keepAlive: true)
List<LanguageOption> languageList(Ref ref) {
  return const [
    LanguageOption('hi-IN', 'Hindi', 'हिन्दी'),
    LanguageOption('pa-IN', 'Punjabi', 'ਪੰਜਾਬੀ'),
    LanguageOption('en-US', 'English', 'English'),
    LanguageOption('ta-IN', 'Tamil', 'தமிழ்'),
    LanguageOption('te-IN', 'Telugu', 'తెలుగు'),
    LanguageOption('ml-IN', 'Malayalam', 'മലയാളം'),
    LanguageOption('kn-IN', 'Kannada', 'ಕನ್ನಡ'),
    LanguageOption('mr-IN', 'Marathi', 'मराठी'),
    LanguageOption('bn-IN', 'Bengali', 'বাংলা'),
    LanguageOption('gu-IN', 'Gujarati', 'ગુજરાતી'),
    LanguageOption('ur-PK', 'Urdu', 'اردو'),
    LanguageOption('ar-SA', 'Arabic', 'عربي'),
    LanguageOption('ar-AE', 'Levantine Arabic', 'عربي (الشام)'),
    LanguageOption('as-IN', 'Assamese', 'অসমীয়া'),
    LanguageOption('az-AZ', 'Azerbaijani', 'Azərbaycan dili'),
    LanguageOption('be-BY', 'Belarusian', 'беларуская'),
    LanguageOption('bg-BG', 'Bulgarian', 'български'),
    LanguageOption('cs-CZ', 'Czech', 'čeština'),
    LanguageOption('de-DE', 'German', 'Deutsch'),
    LanguageOption('el-GR', 'Greek', 'Ελληνικά'),
    LanguageOption('es-ES', 'Spanish', 'Español'),
    LanguageOption('fr-FR', 'French', 'Français'),
    LanguageOption('he-IL', 'Hebrew', 'עברית'),
    LanguageOption('hr-HR', 'Croatian', 'Hrvatski'),
    LanguageOption('hu-HU', 'Hungarian', 'Magyar'),
    LanguageOption('id-ID', 'Indonesian', 'Bahasa Indonesia'),
    LanguageOption('it-IT', 'Italian', 'Italiano'),
    LanguageOption('ja-JP', 'Japanese', '日本語'),
    LanguageOption('ko-KR', 'Korean', '한국어'),
    LanguageOption('lv-LV', 'Latvian', 'latviešu'),
    LanguageOption('mk-MK', 'Macedonian', 'македонски'),
    LanguageOption('nl-NL', 'Dutch', 'Nederlands'),
    LanguageOption('pl-PL', 'Polish', 'Polski'),
    LanguageOption('pt-PT', 'Portuguese', 'Português'),
    LanguageOption('pt-BR', 'Portuguese (Brazil)', 'Português (Brasil)'),
    LanguageOption('ro-RO', 'Romanian', 'Română'),
    LanguageOption('ru-RU', 'Russian', 'Русский'),
    LanguageOption('sv-SE', 'Swedish', 'Svenska'),
    LanguageOption('tr-TR', 'Turkish', 'Türkçe'),
    LanguageOption('uk-UA', 'Ukrainian', 'Українська'),
    LanguageOption('vi-VN', 'Vietnamese', 'Tiếng Việt'),
    LanguageOption('zh-CN', 'Chinese', '中文'),
    LanguageOption('zh-TW', 'Chinese (Traditional)', '繁體中文'),
  ];
}
