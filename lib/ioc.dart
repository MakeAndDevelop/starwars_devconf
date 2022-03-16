import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'ioc.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default,
)
void configureDependencies() => $initGetIt(iocContainer);

GetIt get iocContainer => GetIt.instance;
