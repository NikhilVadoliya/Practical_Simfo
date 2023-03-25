abstract class NetworkState {
  final bool? isConnected;

  NetworkState(this.isConnected);
}

class InitState extends NetworkState {
  InitState() : super(null);
}

class NetworkChangeState extends NetworkState {
  NetworkChangeState(super.isConnected);
}
