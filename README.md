# Flutter Project Template

템플릿을 복사한 뒤 아래 스크립트 한 번만 실행하면 패키지명과 번들 ID를 한꺼번에 바꿀 수 있습니다.

```bash
./scripts/rename_project.sh <dart_package_name> <android_package> "<app_display_name>" [ios_bundle_id]
```

예시:

```bash
./scripts/rename_project.sh my_app com.mycompany.myapp "My App"
```

변경되는 항목:

- `pubspec.yaml` 패키지명
- Dart import 경로
- Android `namespace`, `applicationId`, Kotlin package 경로
- iOS `PRODUCT_BUNDLE_IDENTIFIER`
- 앱 표시 이름(`android:label`, `CFBundleDisplayName`, `CFBundleName`)
- `MaterialApp.title`

실행 후:

```bash
flutter pub get
flutter clean
flutter run
```

## Flutter 버전 (FVM)

Flutter 버전은 `.fvmrc`로 고정합니다. CI도 이 파일의 버전으로 빌드합니다.

```bash
fvm install
fvm use
```

## 환경 분리 (dev / prod)

환경별 값은 `env/dev.json`, `env/prod.json`에 두고 `--dart-define-from-file`로 주입합니다.
코드에서는 `AppEnv`(`lib/core/config/app_env.dart`)로 읽습니다.

```bash
flutter run --dart-define-from-file=env/dev.json
flutter build apk --dart-define-from-file=env/prod.json
```

VS Code에서는 실행 구성에서 `dev` / `prod`를 선택하면 됩니다.

> `env/*.json`은 커밋되므로 API 키 같은 비밀 값은 넣지 마세요.
