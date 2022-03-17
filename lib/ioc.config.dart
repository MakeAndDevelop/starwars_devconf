// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'common/mappers/mapper.dart' as _i3;
import 'features/films/bloc/film_cubit.dart' as _i7;
import 'features/films/data/film_data_source.dart' as _i6;
import 'features/films/data/mappers/film_mapper.dart' as _i5;
import 'features/films/films.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Mapper<_i4.FilmDto, _i4.Film>>(() => _i5.FilmMapper());
  gh.factory<_i6.FilmDataSource>(() => _i6.FilmDataSource(get<_i3.Mapper<_i4.FilmDto, _i4.Film>>()));
  gh.factory<_i7.FilmsCubit>(() => _i7.FilmsCubit(get<_i6.FilmDataSource>()));
  return get;
}
