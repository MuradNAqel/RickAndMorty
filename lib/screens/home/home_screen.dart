import 'dart:async';

import 'package:breaking_bad/bloc/cubit/charecters_cubit.dart';
import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/screens/home/widgets/charecter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/charecter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Charecter> charecters = [];
  var scrollController = ScrollController();
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    setupScrollController(context);
    BlocProvider.of<CharectersCubit>(context).getCharecters();
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      // if (scrollController.position.pixels != 0) {
      //   if (scrollController.position.pixels ==
      //       scrollController.position.maxScrollExtent) {
      //     BlocProvider.of<CharectersCubit>(context).getCharecters();

      //     setState(() {});
      //   }
      // }
      if (scrollController.position.pixels > nextPageTrigger) {
        setState(() {
          BlocProvider.of<CharectersCubit>(context).getCharecters();
        });
      }
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharectersCubit, CharectersState>(
      builder: (context, state) {
        if (state is CharectersLoading && state.isFirstFetch) {
          return showLoadingIndicator();
        }
        if (state is CharectersLoading) {
          //charecters.addAll(state.oldCharecters);
          charecters = state.oldCharecters;
          isLoading = true;
        } else if (state is CharectersLoaded) {
          //charecters.addAll(state.charecters);
          charecters = state.charecters;
        }
        return buildLoadedList();
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(children: [
          buildCharecters(),
        ]),
      ),
    );
  }

  Widget buildCharecters() {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemCount: charecters.length + (isLoading ? 1 : 0),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, idx) {
        if (idx < charecters.length) {
          return CharecterCard(charecters[idx]);
        } else {
          Timer(const Duration(milliseconds: 30), () {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });

          return showLoadingIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          title: const Text(
            'Charecters',
            style: TextStyle(color: MyColors.myGrey),
          )),
      body: buildBlocWidget(),
    );
  }
}
