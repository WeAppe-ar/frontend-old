import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weappear/login/view/login_page.dart';
import 'package:weappear_localizations/weappear_localizations.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepository authRepository,
    required DataPersistenceRepository dataPersistenceRepository,
    Key? key,
  })  : _authRepository = authRepository,
        _dataPersistenceRepository = dataPersistenceRepository,
        super(key: key);

  final AuthRepository _authRepository;
  final DataPersistenceRepository _dataPersistenceRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _dataPersistenceRepository),
      ],
      child: const ViewApp(),
    );
  }
}

class ViewApp extends StatelessWidget {
  const ViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SegoeUI',
        scaffoldBackgroundColor: const Color(0xfffbfafc),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PageLogin(),
    );
  }
}
