// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:fluffer1/data/home_database.dart' as _i376;
import 'package:fluffer1/data/home_repository.dart' as _i812;
import 'package:fluffer1/pages/home/bloc/home_bloc.dart' as _i955;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {

  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i376.AppDatabase>(() => _i376.AppDatabase());
    gh.lazySingleton<_i812.HomeRepository>(
      () => _i812.HomeRepository(gh<_i376.AppDatabase>()),
    );
    gh.factory<_i955.HomeBloc>(
      () => _i955.HomeBloc(gh<_i812.HomeRepository>()),
    );
    return this;
  }
}
