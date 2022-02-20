APP_DEV = wallpaper.fullhd.dev
APP_PROD = wallpaper.fullhd.w2k.w4k.w8k
MASTER_PATH = $(shell pwd)
GRADLEW_PATH = gradlew.bat # Windows
detected_OS = Windows

default:
	@echo "Welcome there! cd: $(MASTER_PATH)"

goto_master_path:
	cd $(MASTER_PATH)

run_prod: goto_master_path
	flutter run --release --flavor prod -t lib/main.dart

run_prod_debug: goto_master_path
	flutter run --debug --flavor prod -t lib/main.dart

run_dev: goto_master_path
	flutter run --debug --flavor dev -t lib/main_dev.dart

build_app_prod_apk: goto_master_path
	flutter build apk --release --flavor prod -t lib/main.dart


build_app_prod_bundle: goto_master_path
	flutter build appbundle --release --flavor prod -t lib/main.dart

clean: goto_master_path
	flutter clean &&\
 	flutter pub get

code_generate: goto_master_path
	flutter packages pub run build_runner build --delete-conflicting-outputs &&\
	flutter packages pub run build_runner watch

debug_view_start_dev:
	adb shell setprop debug.firebase.analytics.app $(APP_DEV)

debug_view_start_prod:
	adb shell setprop debug.firebase.analytics.app $(APP_PROD)

debug_view_stop: goto_master_path
	adb shell setprop debug.firebase.analytics.app .none


help:
	@echo "-----------------------------------------------------"
	@echo "  Just working when buildType: release, flavor: prod   "
	@echo "-----------------------------------------------------"
	@echo "run_app_prod #run app"
	@echo "build_app_prod_apk #build apk"
	@echo "build_app_prod_bundle #build app bundle *recommended*"
	@echo "clean #flutter clean"
	@echo "code_generate #code generate"
	@echo "help"