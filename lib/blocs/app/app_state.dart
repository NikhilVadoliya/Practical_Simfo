abstract class ApplicationState {
  final int cartCount;

  ApplicationState(this.cartCount);
}

class InitApplicationState extends ApplicationState {
  InitApplicationState() : super(0);
}

class UpdatedCartItem extends ApplicationState {
  UpdatedCartItem(super.cartCount);
}
