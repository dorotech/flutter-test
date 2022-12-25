import 'package:flutter/material.dart';
import '../model/rickandmorty_model.dart';

@immutable
abstract class RickandMortyState {}

class RickandMortyInitial extends RickandMortyState {}

class RickandMortyLoading extends RickandMortyState {}

class RickandMortyLoaded extends RickandMortyState {
  late final RickandMortyModel? rickandMortyModel;
  RickandMortyLoaded({this.rickandMortyModel});
}

class RickandMortyError extends RickandMortyState {
  final String error;
  RickandMortyError(this.error);
}
