import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/simple_observer.dart';
import 'package:reads/widget/splash_screen.dart';

void main() async {
  await Hive.initFlutter();

 Bloc.observer = SimpleObserver();
 Hive.registerAdapter(ReadModelAdapter());
 await Hive.openBox<ReadModel>(kReadBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reads',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}


