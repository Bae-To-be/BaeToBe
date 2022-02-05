import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_form_state.freezed.dart';

@freezed
class ImageFormState with _$ImageFormState {
  factory ImageFormState({
    String? url,
    int? id,
    @Default(false) bool loading,
  }) = _ImageFormState;
}
