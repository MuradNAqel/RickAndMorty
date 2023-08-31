import 'package:breaking_bad/bloc/cubit/charecters_cubit.dart';
import 'package:breaking_bad/constants/settings.dart';
import 'package:breaking_bad/data/repository/charecter_repository.dart';
import 'package:breaking_bad/data/web_services/charecter_web_service.dart';
import 'package:breaking_bad/screens/details/details_screen.dart';
import 'package:breaking_bad/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  // late CharecterRepository charecterRepository;
  // late CharectersCubit charectersCubit;

  // Routes(){
  //   charecterRepository =
  //       CharecterRepository(charecterWebService: CharecterWebService());
  //   charectersCubit = CharectersCubit(charecterRepository);
  // }

  static GoRouter? router = GoRouter(initialLocation: homeScreenPath, routes: [
    GoRoute(
      path: homeScreenPath,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            CharectersCubit(CharecterRepository(CharecterWebService())),
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: detailsScreenPath,
      builder: (context, state) => DetailsScreen(),
    ),
  ]);
}
