import 'package:clean_architecture/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture); // DataConnectionChecker.hasConnection이 true를 반환했다는 가정하에
      // act
      final result = networkInfoImpl.isConnected;
      // assert
      verify(mockDataConnectionChecker
          .hasConnection); // DataConnectionChecker.hasConnection이 수행되었는지 검증한다
      expect(result, tHasConnectionFuture);
    });
  });
}
