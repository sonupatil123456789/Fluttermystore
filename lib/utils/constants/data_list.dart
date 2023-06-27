class dataLists {
  static const List<Map> priceFilter = [
    {'title': 'Under 20000', 'Value': '20000', 'Query': '/filter/priceFilter/?smaller=20000'},
    {'title': 'Under 30000', 'Value': '30000', 'Query': '/filter/priceFilter/?smaller=30000'},
    {'title': 'Under 40000', 'Value': '40000', 'Query': '/filter/priceFilter/?smaller=40000'},
    {'title': 'Under 60000', 'Value': '60000', 'Query': '/filter/priceFilter/?smaller=60000'},
    {'title': 'Above 80000', 'Value': '80000', 'Query': '/filter/priceFilter/?greater=80000'},
    {'title': 'Above 100000', 'Value': '100000', 'Query': '/filter/priceFilter/?greater=100000'},
    {'title': 'Above 120000', 'Value': '120000', 'Query': '/filter/priceFilter/?greater=120000'},
    {'title': 'Above 150000', 'Value': '80000', 'Query': '/filter/priceFilter/?greater=150000'},
  ];

  static const List<Map> colorFilter = [
    {'title': 'white', 'Value': '#FFFFFF', 'Query': '/filter/colorFilter/?color=FFFFFF'},
    {'title': 'black', 'Value': '#000000', 'Query': '/filter/colorFilter/?color=000000'},
    {'title': 'pink', 'Value': '#E696F2', 'Query': '/filter/colorFilter/?color=E696F2'},
    {'title': 'purple', 'Value': '#B4BCF1', 'Query': '/filter/colorFilter/?color=B4BCF1'},
    {'title': 'Green', 'Value': '#69FFCB', 'Query': '/filter/colorFilter/?color=69FFCB'},
    {'title': 'Starlight', 'Value': '#FF9A9A', 'Query': '/filter/colorFilter/?color=FF9A9A'},
  ];

   static const List<Map> PercentageFilter = [
    {'title': '10% Discount', 'Value': '10', 'Query': '/filter/PercentageFilter/?offerPercent=10'},
    {'title': '20% Discount', 'Value': '20', 'Query': '/filter/PercentageFilter/?offerPercent=20'},
    {'title': '40% Discount', 'Value': '40', 'Query': '/filter/PercentageFilter/?offerPercent=40'},
     {'title': '50% Discount', 'Value': '50', 'Query': '/filter/PercentageFilter/?offerPercent=50'},
    {'title': '60% Discount', 'Value': '60', 'Query': '/filter/PercentageFilter/?offerPercent=60'},
    {'title': '70% Discount', 'Value': '70', 'Query': '/filter/PercentageFilter/?offerPercent=70'},
    {'title': '80% Discount', 'Value': '80', 'Query': '/filter/PercentageFilter/??offerPercent=80'},

  ];

  
}
