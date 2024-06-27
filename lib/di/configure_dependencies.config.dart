// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../token/repository/token_repository.dart' as _i4;
import 'dependencies.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singletonAsync<_i3.Dependencies>(() {
      final i = _i3.Dependencies();
      return i.init().then((_) => i);
    });
    gh.factoryAsync<_i4.TokenRepository>(() {
      final i = _i4.TokenRepository(useCaching: gh<bool>());
      return i.initTokens().then((_) => i);
    });
    return this;
  }
}
