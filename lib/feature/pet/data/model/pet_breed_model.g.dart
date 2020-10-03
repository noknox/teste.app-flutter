// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetBreedModel _$PetBreedModelFromJson(Map<String, dynamic> json) {
  return PetBreedModel()
    ..category = _$enumDecodeNullable(_$PetCategoryEnumMap, json['category'])
    ..name = json['name'] as String;
}

Map<String, dynamic> _$PetBreedModelToJson(PetBreedModel instance) =>
    <String, dynamic>{
      'category': _$PetCategoryEnumMap[instance.category],
      'name': instance.name,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PetCategoryEnumMap = {
  PetCategory.dog: 'dog',
  PetCategory.cat: 'cat',
  PetCategory.bird: 'bird',
  PetCategory.other: 'other',
};
