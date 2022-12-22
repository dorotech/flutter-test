import 'package:flutter_modular/flutter_modular.dart';

import 'detail_page.dart';

class DetailModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => DetailPage(
        characterDetail: args.data,
      ),
    ),
  ];
}
