import 'logger.dart';

/// 성공/실패 결과 타입
///
/// ```dart
/// final result = await Result.guard(() => repository.fetchUser());
/// switch (result) {
///   case Success(:final data):
///     // 성공 처리
///   case Failure(:final error):
///     // 실패 처리
/// }
/// ```
///
// TODO: 에러 타입을 Object 대신 앱 전용 예외 클래스(예: AppException)로
// 관리하고 싶다면 아래 `Object error`를 해당 클래스로 교체하세요.
sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = Success<T>;

  const factory Result.failure(Object error, [StackTrace? stackTrace]) =
      Failure<T>;

  /// 비동기 작업을 실행하고, 예외가 발생하면 [Failure]로 감싸서 반환
  static Future<Result<T>> guard<T>(Future<T> Function() body) async {
    try {
      return Success(await body());
    } catch (error, stackTrace) {
      Logger.e(
        'Result.guard failed',
        tag: 'Result',
        error: error,
        stackTrace: stackTrace,
      );
      return Failure(error, stackTrace);
    }
  }

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  /// 성공이면 데이터, 실패면 null
  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Failure() => null,
  };

  /// 성공/실패에 따라 분기 처리
  R when<R>({
    required R Function(T data) success,
    required R Function(Object error, StackTrace? stackTrace) failure,
  }) {
    return switch (this) {
      Success(:final data) => success(data),
      Failure(:final error, :final stackTrace) => failure(error, stackTrace),
    };
  }

  /// 성공 데이터를 변환, 실패는 그대로 전달
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success(:final data) => Success(transform(data)),
      Failure(:final error, :final stackTrace) => Failure(error, stackTrace),
    };
  }
}

/// 성공 결과
final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

/// 실패 결과
final class Failure<T> extends Result<T> {
  const Failure(this.error, [this.stackTrace]);

  final Object error;
  final StackTrace? stackTrace;
}
