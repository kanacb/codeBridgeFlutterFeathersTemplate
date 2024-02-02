import '../components/businesses/businessesMain.dart';
import '../components/categories/categoriesMain.dart';
import '../components/commodities/commoditiesMain.dart';
import '../components/currencies/currenciesMain.dart';
import '../components/deliveryMethod/deliveryMethodMain.dart';
import '../components/inbox/inboxMain.dart';
import '../components/paymentTerms/paymentTermsMain.dart';
import '../components/price/priceMain.dart';
import '../components/quotation/quotationMain.dart';
import '../components/request4quote/request4quoteMain.dart';
import '../components/rfqwon/rfqwonMain.dart';
import '../components/users/usersMain.dart';

const String projectName = "Trade Oil Futures";
const String projectDescription = "An oil futures trading platform";
const List<Map<String, dynamic>> tradeBinary = [{"name": "Buyer"}, {"name": "Seller"}];
const List<Map<String, dynamic>> languages = [{"name": "English"}, {"name": "Malay"}];
const List<Map<String, dynamic>> currency = [{"name": "RM"}, {"name": "USD"}];
const List<Map<String, dynamic>> dateFormat = [{"name": "DD/MM/YY"}, {"name": "MM/DD/YY"}];
const List<Map<String, dynamic>> timeFormat = [{"name": "HH:mm:ss"}, {"name": "HH:mm:ss.sss"}];
const List<Map<String, dynamic>> timeZone = [{"name": "+8 GMT"}, {"name": "+7 GMT"}];
const Map<String, String> quadStakeHolder = {"name": "VX Index"};
const Map<String, String> quadPlatform = {"name": "Cloud Basha"};


const List<Map<String, dynamic>> userStates = [
  {
    "userState": "anonymous",
    "tabs": ["VX Index", "VX Fin", "Trends"],
    "name": "on boarding",
    "header": "VX Index",
    "title": "Vx Index",
    "image":
        "https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg"
  },
  {
    "userState": "loggedIn",
    "name": "logging",
    "tabs": ["Trader", "Activity", "VX Fin", "Transactions", "Trends"],
    "header": "Logged",
    "title": "Vx Index",
    "image": ""
  },
  {
    "userState": "registered",
    "name": "trading",
    "tabs": ["Business", "Activity", "VX Fin", "Transactions", "Trends"],
    "header": "Trader",
    "title": "Vx Index",
    "image": ""
  },
  {
    "userState": "subscribed",
    "name": "subscribed",
    "tabs": ["Subscriber", "Activity", "VX Fin", "Transactions", "Trends"],
    "header": "Sub",
    "title": "Vx Index",
    "image": ""
  },
  {
    "userState": "admin",
    "name": "admin",
    "tabs": ["Admin", "Activity", "VX Fin", "Transactions", "Trends"],
    "header": "Admin",
    "title": "Vx Index",
    "image": ""
  },
];

List<Map<String, dynamic>> services = [
  {
    'name': 'users',
    'label': 'Users',
    'serviceName': 'users',
    "screen": const UsersScreen(),
    "order": 7,
    "image":
        "https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg"
  },
  {
    'name': 'businesses',
    'label': 'Businesses',
    'serviceName': 'businesses',
    "screen": const BusinessesScreen(),
    "order": 3,
    "image":
        "https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg"
  },
  {
    'name': 'currencies',
    'label': 'Currencies',
    'serviceName': 'currencies',
    "screen": const CurrenciesScreen(),
    "order": 3,
    "image":
        "https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg"
  },
  {
    'name': 'categories',
    'label': 'Categories',
    'serviceName': 'categories',
    "screen": const CategoriesScreen(),
    "order": 3,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'commodities',
    'label': 'Commodities',
    'serviceName': 'commodities',
    "screen": const CommoditiesScreen(),
    "order": 3,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'request4quote',
    'label': 'Rfq',
    'serviceName': 'request4quote',
    "screen": const Request4quoteScreen(),
    "order": 1,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'deliveryMethod',
    'label': 'Delivery Method',
    'serviceName': 'deliveryMethod',
    "screen": const DeliveryMethodScreen(),
    "order": 4,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'paymentTerms',
    'label': 'Payment Terms',
    'serviceName': 'paymentTerms',
    "screen": const PaymentTermsScreen(),
    "order": 4,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'quotation',
    'label': 'Quotation',
    'serviceName': 'quotation',
    "screen": const QuotationScreen(),
    "order": 2,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'won',
    'label': 'Won',
    'serviceName': 'rfqwon',
    "screen": const RfqwonScreen(),
    "order": 3,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'inbox',
    'label': 'Inbox',
    'serviceName': 'inbox',
    "screen": const InboxScreen(),
    "order": 5,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  },
  {
    'name': 'price',
    'label': 'Price',
    'serviceName': 'price',
    "screen": const PriceScreen(),
    "order": 6,
    "image":
        "https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"
  }
];
