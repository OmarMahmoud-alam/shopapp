import 'package:bloc/bloc.dart';
import 'package:shopapp/board/cubitBordstate.dart';

class CubitBoard extends Cubit<BoardState> {
  CubitBoard(BoardState initialState) : super(initialState);
}
