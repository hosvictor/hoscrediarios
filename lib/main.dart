import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoscrediarios/blocs/auth_bloc.dart';
import 'routes.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AppStarted()), // Inicia o BLoC
      child: MaterialApp(
        title: 'HOS Crediários',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: const Color.fromRGBO(245, 245, 245, 1),
          fontFamily: 'Inter',
          textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'BeVietnamPro',
              letterSpacing: 0.5,
            )
          )
        ),
        onGenerateRoute: generateRoute, // Usa a função de rotas nomeadas
        initialRoute: '/', // Rota inicial
      ),
    );
  }
  
}
