// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'common/mappers/mapper.dart' as _i4;
import 'common/network/network_ioc_module.dart' as _i14;
import 'features/characters/bloc/character_cubit.dart' as _i13;
import 'features/characters/data/character_data_source.dart' as _i10;
import 'features/characters/data/dtos/character_dto.dart' as _i7;
import 'features/characters/data/mappers/character_mapper.dart' as _i9;
import 'features/characters/models/character.dart' as _i8;
import 'features/films/bloc/film_cubit.dart' as _i12;
import 'features/films/data/film_data_source.dart' as _i11;
import 'features/films/data/mappers/film_mapper.dart' as _i6;
import 'features/films/films.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkIocModule = _$NetworkIocModule();
  gh.factory<_i3.Dio>(() => networkIocModule.dio);
  gh.factory<_i4.Mapper<_i5.FilmDto, _i5.Film>>(() => _i6.FilmMapper());
  gh.factory<_i4.Mapper<_i7.CharacterDto, _i8.Character>>(() => _i9.CharacterMapper());
  gh.factory<_i10.CharacterDataSource>(
      () => _i10.CharacterDataSource(get<_i4.Mapper<_i7.CharacterDto, _i8.Character>>(), get<_i3.Dio>()));
  gh.factory<_i11.FilmDataSource>(() => _i11.FilmDataSource(get<_i4.Mapper<_i5.FilmDto, _i5.Film>>(), get<_i3.Dio>()));
  gh.factory<_i12.FilmsCubit>(() => _i12.FilmsCubit(get<_i11.FilmDataSource>()));
  gh.factory<_i13.CharacterCubit>(() => _i13.CharacterCubit(get<_i10.CharacterDataSource>()));
  return get;
}

class _$NetworkIocModule extends _i14.NetworkIocModule {}
