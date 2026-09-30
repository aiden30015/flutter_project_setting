import 'package:flutter_test/flutter_test.dart';
import 'package:project_setting/core/utils/result.dart';

void main() {
  group('Result', () {
    test('success', () {
      const Result<int> result = Result.success(1);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.dataOrNull, 1);
    });

    test('failure', () {
      final Result<int> result = Result.failure(Exception('error'));

      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);
      expect(result.dataOrNull, isNull);
    });

    test('guard는 성공 시 Success를 반환한다', () async {
      final result = await Result.guard(() async => 'ok');

      expect(result, isA<Success<String>>());
      expect(result.dataOrNull, 'ok');
    });

    test('guard는 예외 발생 시 Failure를 반환한다', () async {
      final exception = Exception('error');
      final result = await Result.guard<String>(() async => throw exception);

      expect(result, isA<Failure<String>>());
      expect((result as Failure<String>).error, exception);
      expect(result.stackTrace, isNotNull);
    });

    test('when은 상태에 맞는 콜백을 호출한다', () {
      const Result<int> success = Result.success(1);
      const Result<int> failure = Result.failure('error');

      String describe(Result<int> result) => result.when(
        success: (data) => 'success $data',
        failure: (error, _) => 'failure $error',
      );

      expect(describe(success), 'success 1');
      expect(describe(failure), 'failure error');
    });

    test('map은 성공 데이터만 변환한다', () {
      const Result<int> success = Result.success(2);
      const Result<int> failure = Result.failure('error');

      expect(success.map((data) => data * 2).dataOrNull, 4);
      expect(failure.map((data) => data * 2).isFailure, isTrue);
    });
  });
}
