import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_inject/injection/injection_injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
