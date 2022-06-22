// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as i3;
import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;

import 'common/mappers/mapper.dart' as i4;
import 'common/network/network_ioc_module.dart' as i14;
import 'features/characters/bloc/character_cubit.dart' as i13;
import 'features/characters/data/character_data_source.dart' as i10;
import 'features/characters/data/dtos/character_dto.dart' as i7;
import 'features/characters/data/mappers/character_mapper.dart' as i9;
import 'features/characters/models/character.dart' as i8;
import 'features/films/bloc/film_cubit.dart' as i12;
import 'features/films/data/film_data_source.dart' as i11;
import 'features/films/data/mappers/film_mapper.dart' as i6;
import 'features/films/films.dart' as i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
i1.GetIt $initGetIt(i1.GetIt get, {String? environment, i2.EnvironmentFilter? environmentFilter}) {
  final gh = i2.GetItHelper(get, environment, environmentFilter);
  final networkIocModule = _$NetworkIocModule();
  gh.factory<i3.Dio>(() => networkIocModule.dio);
  gh.factory<i4.Mapper<i5.FilmDto, i5.Film>>(() => i6.FilmMapper());
  gh.factory<i4.Mapper<i7.CharacterDto, i8.Character>>(() => i9.CharacterMapper());
  gh.factory<i10.CharacterDataSource>(
      () => i10.CharacterDataSource(get<i4.Mapper<i7.CharacterDto, i8.Character>>(), get<i3.Dio>()));
  gh.factory<i11.FilmDataSource>(() => i11.FilmDataSource(get<i4.Mapper<i5.FilmDto, i5.Film>>(), get<i3.Dio>()));
  gh.factory<i12.FilmsCubit>(() => i12.FilmsCubit(get<i11.FilmDataSource>()));
  gh.factory<i13.CharacterCubit>(() => i13.CharacterCubit(get<i10.CharacterDataSource>()));
  return get;
}

class _$NetworkIocModule extends i14.NetworkIocModule {}
