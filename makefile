## Mac OS
denied:
	cd scripts && chmod +x pre-bootstrap.sh

pre-bootstrap:
	cd scripts && ./pre-bootstrap.sh
	fvm install 3.10.6
	fvm use 3.10.6 --force
	fvm flutter --version

pub-get:
	@melos clean --sdk-path=.fvm/flutter_sdk
	@melos bootstrap --sdk-path=.fvm/flutter_sdk

build-init: 
	@melos gen-app-icon
	@melos gen-app-splash $(flavor)
	
build-runner: 
	@melos build-domain
	@melos build-data
	@melos build-resources
	@melos gen-strings

build-string: 
	@melos gen-strings

build-resource: 
	@melos build-resources
	
run:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) run $(device)

build-ios:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) build ipa $(buildName) $(buildNumber)

build-android-apk:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) build apk $(buildName) $(buildNumber)

build-android-aab:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) build aab $(buildName) $(buildNumber)

unused:
	@melos unused-string-resource
	@melos unused-file-app
	@melos unused-file-domain
	@melos unused-file-data
	@melos unused-file-resource
