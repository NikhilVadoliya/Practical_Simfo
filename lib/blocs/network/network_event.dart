abstract class NetworkEvent {}

class StartListener extends NetworkEvent {}

class OnInternetConnectionStateChange extends NetworkEvent {
  final bool isConnected;

  OnInternetConnectionStateChange(this.isConnected);
}
