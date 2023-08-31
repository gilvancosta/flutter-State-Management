// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImcState {
  
  final double imc;
  ImcState({
    required this.imc,
  });
}

class ImcStateLoading extends ImcState {
  ImcStateLoading() : super(imc: 0);
}

class ImcStateError extends ImcState {
  final String message;
  ImcStateError({required this.message}) : super(imc: 0);
}
