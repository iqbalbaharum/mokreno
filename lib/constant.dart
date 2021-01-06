import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum Flavor { development, production }

@immutable
class Constants {
  static Constants _instance;
  final String endpoint;

  const Constants({
    @required this.endpoint,
  });

  factory Constants.of() {
    if (_instance != null) {
      return _instance;
    }

    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.development:
        _instance = Constants._dev();
        break;
      case Flavor.production:
      default:
        _instance = Constants._prd();
    }

    return _instance;
  }

  factory Constants._dev() {
    return const Constants(endpoint: 'http://api.letservis.com');
  }

  factory Constants._prd() {
    return const Constants(endpoint: 'http://api.letservis.com');
  }

  // Routing name
  static const String pageSignIn = '/signin';
  static const String pageSignUp = '/signup';
  static const String pageHome = '/home';
  static const String pageNewRequest = '/new';
  static const String pageProfile = '/profile';

  //  Color
  // static const

  // Font

  // Notification
  static const String notiChannelId = 'letservis';
  static const String notifChannelName = 'letservis';
  static const String notiChannelDescription = 'letservis';

  // Other
  static const String toA = """ 
The vehicles that are given to our runner is in good condition without any valuable things in it.
    
The owner of the vehicles had signed the agreement that allows our runner to drive their vehicle to the service center.

Vehicles that were driven by our runner will directly send to the service center and will not be used for personal purposes.

Any CRIME / OFFENSES OF MALAYSIAN GOVERNMENT LAW will be held accountable by our runner if it occurs during their supervision.

Our company will be fully responsible if the customer’s vehicle is being fined during our service.

If any accident occurs during our service, the customers will not be able to claim any payment / compensation from our runner. We will only provide a consolation payment up to RM500 depending on the vehicle’s condition.

Our company will not give the customer’s vehicle to be driven by any people other than our runner during the service period.

The owner of the vehicle agrees to settle all the payments before the service of the vehicle begins, where an invoice will be given to the owner for them to know the exact price of the service charged by the service center itself.

The customers agree to be charged RM50 from our company for this service.
    """;
}
