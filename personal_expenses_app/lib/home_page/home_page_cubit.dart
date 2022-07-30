import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/home_page/home_page_components/item_card.dart';
import 'package:personal_expenses_app/home_page/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageStateInitial());
  List<ItemCard> listOfItemsCard = [];
  void addItemCard(String itemName, DateTime itemDate, double amount) {
    listOfItemsCard.add(ItemCard(
      itemName: itemName,
      itemDate: DateFormat.yMMMMd("en_US").format(itemDate),
      itemPrice: amount,
    ));
    emit(AddItemCard());
  }
}
