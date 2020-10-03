// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return PetModel()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..breed = json['breed'] == null
        ? null
        : PetBreedModel.fromJson(json['breed'] as Map<String, dynamic>)
    ..photoUrl = json['photo_url'] as String;
}

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'breed': instance.breed?.toJson(),
      'photo_url': instance.photoUrl,
    };
