APP_PACKAGE = hd.fullhd.4d.wallpaper
MASTER_PATH = $(shell pwd)
GRADLEW_PATH = gradlew.bat # Windows
detected_OS = Windows

default:
	@echo "Welcome there! cd: $(MASTER_PATH)"

goto_master_path:
	cd $(MASTER_PATH)

run_prod: goto_master_path
	flutter run --release --flavor prod -t lib/main.dart

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