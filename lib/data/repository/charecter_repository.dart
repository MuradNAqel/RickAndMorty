import 'package:breaking_bad/data/web_services/charecter_web_service.dart';

import '../models/charecter.dart';

class CharecterRepository {
  late final CharecterWebService charecterWebService;

  CharecterRepository(
    this.charecterWebService,
  );

  Future<List<Charecter>> getCharecters(int page) async {
    final charecters = await charecterWebService.getCharecters(page);
    return charecters
        .map((character) => Charecter.fromJson(character))
        .toList();
  }
}
