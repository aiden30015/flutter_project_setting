# Features

이 폴더에는 앱의 기능별 모듈을 구현합니다.

## 구조 예시

각 기능은 독립적인 폴더로 구성됩니다:

```
features/
├── auth/
│   ├── data/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   └── usecases/
│   └── presentation/
│       ├── pages/
│       ├── widgets/
│       └── providers/  (또는 blocs/, controllers/)
├── home/
│   └── ...
└── settings/
    └── ...
```

## 사용 예시

```dart
// features/home/presentation/pages/home_page.dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Page')),
    );
  }
}
```
