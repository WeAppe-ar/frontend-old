import 'package:data_persistence/data_persistence.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weappear/app/app.dart';
import 'package:weappear/login/view/login_page.dart';

///import 'package:weappear/app/app.dart';
///import 'package:weappear/login/view/login_page.dart';

void main() {
  late final DataPersistenceRepository dataPersistenceRepository;

  setUp(() async {
    dataPersistenceRepository = DataPersistenceRepository();
    await dataPersistenceRepository.init(
      test: true,
      testFileName: 'app_test.dart',
    );
  });

  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      // await tester.pumpWidget(
      //   App(
      //     dataPersistenceRepository: dataPersistenceRepository,
      //   ),
      // );

      await tester.pumpAndSettle();

      expect(find.byType(PageLogin), findsOneWidget);
    });
  });
}
