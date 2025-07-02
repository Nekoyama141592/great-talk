// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailAuthState _$EmailAuthStateFromJson(Map<String, dynamic> json) =>
    _EmailAuthState(
      isSignUp: json['isSignUp'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$EmailAuthStateToJson(_EmailAuthState instance) =>
    <String, dynamic>{
      'isSignUp': instance.isSignUp,
      'isLoading': instance.isLoading,
    };
