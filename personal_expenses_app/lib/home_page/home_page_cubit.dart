import 'package:bloc/bloc.dart';
import 'package:personal_expenses_app/home_page/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageStateInitial());
}
