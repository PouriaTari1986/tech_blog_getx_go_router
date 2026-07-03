// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:equatable/equatable.dart';

class SendEmailEntity extends Equatable {
 final bool? reponse;
 final String? useId;
  const SendEmailEntity({
    this.reponse,
    this.useId,
  });

  @override
  List<Object?> get props => [reponse,useId];
}
