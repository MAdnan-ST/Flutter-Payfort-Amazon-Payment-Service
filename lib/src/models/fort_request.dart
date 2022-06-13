class FortRequest {
  FortRequest({
    required this.amount,
    required this.customerName,
    required this.customerEmail,
    required this.orderDescription,
    required this.sdkToken,
    required this.customerIp,
    this.currency = 'USD',
    this.language = 'en',
    this.merchantReference,
    this.tokenName,
    this.paymentOption,
    this.eci,
    this.phoneNumber,
  }) : command = 'PURCHASE';

  /// Request Command.
  ///
  String command;

  /// The transaction’s amount.
  /// Each currency has predefined allowed decimal points that should be taken into consideration when sending the amount.
  ///
  num amount;

  /// The currency of the transaction’s amount in ISO code 3. Example: AED, USD, EUR, GBP.
  /// By Default currency : [USD].
  ///
  String currency;

  /// The Merchant’s unique order number.
  ///
  String? merchantReference;

  /// The customer’s name.
  ///
  String customerName;

  /// The customer’s email. Example: customer1@domain.com
  ///
  String customerEmail;

  /// A description of the order.
  ///
  String? orderDescription;

  /// The checkout page and messages language.
  /// By default language: [en].
  ///
  String language;

  /// An SDK Token to enable using the Amazon Payment Services Mobile SDK.
  ///
  String sdkToken;

  /// The Token received from the Tokenization process..
  ///
  String? tokenName;

  /// Payment option. [MASTERCARD], [VISA], [AMEX] etc...
  ///
  String? paymentOption;

  /// The E-commerce indicator. example: [ECOMMERCE]
  ///
  String? eci;

  /// It holds the customer’s IP address.
  /// It’s Mandatory, if the fraud service is active.
  /// We support IPv4 and IPv6 as shown in the example below.
  ///
  String? customerIp;

  /// The customer’s phone number.
  ///
  String? phoneNumber;

  Map<String, dynamic> toFortRequest() {
    return <String, dynamic>{
      'command': command,
      'amount': amount.toString(),
      'merchant_reference': '${DateTime.now().millisecondsSinceEpoch}',
      'currency': currency,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'order_description': orderDescription,
      'language': language,
      'sdk_token': sdkToken,
      'token_name': tokenName,
      'payment_option': paymentOption,
      'eci': eci,
      'customer_ip': customerIp,
      'phone_number': phoneNumber,
    };
  }
}
