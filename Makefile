
default:
	@echo "Hello!"

locale_generate:
	flutter pub run intl_utils:generate

json_generate:
	flutter pub run build_runner build --delete-conflicting-outputs

code_generate:
	flutter pub run intl_utils:generate && flutter pub run build_runner build --delete-conflicting-outputs

run:
	flutter run

clean:
	flutter clean && flutter pub get