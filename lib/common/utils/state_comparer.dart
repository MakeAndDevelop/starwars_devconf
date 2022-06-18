import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocBuilderCondition<T> defaultBlocCondition<T>() => (currentState, newState) => currentState != newState;
