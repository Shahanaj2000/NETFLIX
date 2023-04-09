import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/hotAndNew/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/domain/core/dependency_injection/injectable.dart';
import 'package:netflix/presentation/mainpage/screen_main_page.dart';

import 'core/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //! Downloads
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),

        //! Search
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),

        //! FastLaugh
        BlocProvider(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),

        //! HotAndNew
        BlocProvider(
          create: (ctx) => getIt<HotAndNewBloc >(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodySmall: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          primarySwatch: Colors.blue,
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
