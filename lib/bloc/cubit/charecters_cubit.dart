import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/charecter.dart';
import 'package:breaking_bad/data/repository/charecter_repository.dart';
import 'package:meta/meta.dart';

part 'charecters_state.dart';

class CharectersCubit extends Cubit<CharectersState> {
  final CharecterRepository charecterRepository;

  int page = 1;

  CharectersCubit(this.charecterRepository) : super(CubitInitial());

  void getCharecters() {
    if (state is CharectersLoading) return;

    final currentState = state;

    var oldCharecters = <Charecter>[];
    if (currentState is CharectersLoaded) {
      oldCharecters = currentState.charecters;
    }

    emit(CharectersLoading(oldCharecters, isFirstFetch: page == 1));

    charecterRepository.getCharecters(page).then((newPosts) {
      page++;

      final posts = (state as CharectersLoading).oldCharecters;
      posts.addAll(newPosts);

      emit(CharectersLoaded(posts));
    });
  }
}









  // void getAllCharecters() {
  //   charecterRepository.getAllCharecters().then((charecters) {
  //     emit(CharectersLoaded(charecters));
  //     this.charecters = charecters;
  //   });
  //   return charecters;
  // }