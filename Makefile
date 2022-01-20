
code_generate:
	flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/resources.dart && \
    flutter pub run intl_translation:generate_from_arb \--output-dir=lib/l10n --no-use-deferred-loading \lib/l10n/resources.dart lib/l10n/intl_*.arb

json_generate:
	flutter pub run build_runner build --delete-conflicting-outputs