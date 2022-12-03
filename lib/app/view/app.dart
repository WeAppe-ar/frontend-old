import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weappear/onboarding/view/onboarding_page.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

class App extends StatelessWidget {
  const App({
    required Client client,
    required DataPersistenceRepository dataPersistenceRepository,
    super.key,
  })  : _client = client,
        _dataPersistenceRepository = dataPersistenceRepository;

  final Client _client;
  final DataPersistenceRepository _dataPersistenceRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _client),
        RepositoryProvider.value(value: _dataPersistenceRepository),
      ],
      child: AppSize.child(
        child: const ViewApp(),
      ),
    );
  }
}

class ViewApp extends StatefulWidget {
  const ViewApp({super.key});

  @override
  State<ViewApp> createState() => _ViewAppState();
}

class _ViewAppState extends State<ViewApp> {
  @override
  void initState() {
    super.initState();
    WeAppearUi.initUI();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: WeAppearTheme.lightTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Navigator(
        onPopPage: (Route<dynamic> route, dynamic result) => route.didPop(result),
        pages: const [
          MaterialPage<void>(
            child: PageOnboarding(),
            key: ValueKey('onboarding'),
          ),
        ],
      ),
    );
  }
}
