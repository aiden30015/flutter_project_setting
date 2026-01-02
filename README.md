# 🚀 Flutter Project Template

Flutter 프로젝트를 빠르게 시작하기 위한 프로덕션 레디 템플릿입니다.

## ✨ 주요 기능

- 📁 **확장 가능한 폴더 구조** - Clean Architecture 기반 모듈화
- 🎨 **다크모드 지원** - Material 3 테마 시스템
- 📏 **엄격한 린트 규칙** - 코드 품질 보장
- 🔧 **유틸리티 & 확장 메서드** - 개발 생산성 향상
- ♻️ **재사용 가능한 위젯** - Loading, Error, Empty 상태 위젯
- 📝 **이슈 및 PR 템플릿** - 협업 효율화
- 🔄 **CI/CD 설정** - 자동화된 빌드 및 테스트
- 📦 **FVM 지원** - Flutter 버전 관리

## 📁 프로젝트 구조

```
lib/
├── main.dart                    # 앱 진입점
├── core/                        # 핵심 기능
│   ├── constants/               # 상수 정의
│   ├── theme/                   # 테마 설정
│   ├── utils/                   # 유틸리티 함수
│   └── extensions/              # 확장 메서드
├── features/                    # 기능별 모듈
│   └── [feature_name]/
│       ├── data/                # 데이터 레이어
│       ├── domain/              # 비즈니스 로직
│       └── presentation/        # UI 레이어
├── shared/                      # 공용 위젯 & 모델
│   └── widgets/
└── services/                    # 외부 서비스 (API, Storage 등)
```

## 🛠️ 시작하기

### 1. 저장소 복제 또는 템플릿 사용

```bash
# 이 템플릿을 새 프로젝트로 사용
git clone https://github.com/aiden30015/flutter_project_setting.git my_new_project
cd my_new_project
```

### 2. FVM으로 Flutter 버전 설정 (선택사항)

```bash
fvm use
fvm flutter pub get
```

또는 일반 Flutter CLI:

```bash
flutter pub get
```

### 3. 앱 실행

```bash
flutter run
```

## 📦 포함된 유틸리티

### Logger
```dart
import 'package:project_setting/core/utils/logger.dart';

Logger.debug('디버그 메시지');
Logger.info('정보 메시지');
Logger.warning('경고 메시지');
Logger.error('에러 메시지', error: e, stackTrace: st);
```

### Context Extensions
```dart
// 테마 접근
context.theme
context.textTheme
context.colorScheme

// 네비게이션
context.push(NextPage());
context.pop();

// SnackBar
context.showSnackBar('성공!');
context.showErrorSnackBar('에러 발생');
```

### 재사용 위젯
```dart
// 로딩
LoadingWidget()
FullScreenLoading(message: '로딩 중...')

// 에러
AppErrorWidget(
  message: '에러가 발생했습니다',
  onRetry: () => loadData(),
)

// 빈 상태
EmptyWidget(message: '데이터가 없습니다')
```

## 🎨 테마 커스터마이징

[lib/core/theme/app_theme.dart](lib/core/theme/app_theme.dart) 파일에서 색상 및 테마를 수정하세요:

```dart
static const Color primaryColor = Colors.blue; // 원하는 색상으로 변경
```

## 📝 상수 관리

[lib/core/constants/app_constants.dart](lib/core/constants/app_constants.dart)에서 앱 전역 상수를 관리:

```dart
class AppConstants {
  static const String appName = 'Your App Name';
  static const String baseUrl = 'https://api.yourapp.com';
  // ...
}
```

## 🧪 테스트 실행

```bash
flutter test
```

## 🔍 린트 규칙

강화된 린트 규칙이 적용되어 있습니다:
- Trailing comma 필수
- Single quotes 사용
- Const 생성자 선호
- Print 사용 금지 (Logger 사용)

자세한 내용은 [analysis_options.yaml](analysis_options.yaml) 참조

## 🤝 기여하기

이슈 및 PR을 환영합니다!

## 📄 라이선스

MIT License

---

**템플릿 버전:** 1.0.0  
**Flutter SDK:** ^3.9.2  
**업데이트:** 2026.01.02