import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/constants/endpoints.dart';
import '../../../common/mappers/mapper.dart';
import '../../../common/network/dio_extensions.dart';
import '../../../common/utils/network_utilities.dart';
import '../models/character.dart';
import 'dtos/character_dto.dart';

@Injectable()
class CharacterDataSource {
  final Mapper<CharacterDto, Character> _mapper;
  final Dio _httpClient;

  CharacterDataSource(this._mapper, this._httpClient);

  Future<Character?> getCharacter(String id) async {
    final response = await _httpClient.get<Map<String, dynamic>>('${Endpoints.characters}/$id/');

    if (response.success && response.data != null) {
      final characterDto = CharacterDto.fromJson(response.data!);
      return _mapper.mapToDestination(characterDto);
    }

    return null;
  }
}
