# Services

이 폴더에는 앱의 서비스 레이어를 구현합니다.

## 구조 예시

```
services/
├── api/
│   ├── api_client.dart       # HTTP 클라이언트 (dio 등)
│   ├── api_endpoints.dart    # API 엔드포인트 정의
│   └── interceptors/         # 인터셉터
├── storage/
│   ├── local_storage.dart    # SharedPreferences 래퍼
│   └── secure_storage.dart   # 보안 저장소
└── auth/
    └── auth_service.dart     # 인증 서비스
```

## 사용 예시

```dart
// API 클라이언트 예시
class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: AppConstants.connectionTimeout,
    receiveTimeout: AppConstants.receiveTimeout,
  ));

  Future<Response> get(String path) => _dio.get(path);
  Future<Response> post(String path, {dynamic data}) => _dio.post(path, data: data);
}
```
