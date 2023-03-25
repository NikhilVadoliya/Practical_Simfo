abstract class ApplicationEvent {}

class AddCartItem extends ApplicationEvent {
  AddCartItem();
}

class RemoveCartItem extends ApplicationEvent {
  RemoveCartItem();
}
