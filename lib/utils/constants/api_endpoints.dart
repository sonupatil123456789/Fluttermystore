class ApiEndpointsUrl {
  static const baseUrl = "http://192.168.59.188:4000";      // 192.168.1.5
  // static const baseUrl = "http://192.168.1.5:4000";

  ////////////authantication endpoints
  static const authUrl = "$baseUrl/api/v1/auth";

  static const loginUrl = "$authUrl/login";
  static const registerUrl = "$authUrl/regiester/new";
  static const verifyUserUrl = "$authUrl/mydata/";

  //////////// product endpoints
  static const productUrl = "$baseUrl/api/v1/products";
  static const getAllProducts = "$productUrl/fetchAllProducts";
  static const likeProducts = "$getAllProducts/like";
  static const searchProducts = "$productUrl/fetchAllProducts/filter/search/";

  static const mainBannerProducts = "$productUrl/fetchProducts/topFiveBannerProducts";
  static const hieghestRating = "$productUrl/fetchProducts/byHiegestRating";
  static const mostLiked = "$productUrl/fetchProducts/byHigestLikedProducts";

    ////////////category endpoints
  static const getAllProductsByCategory = "$productUrl/fetchProducts/byCategory/";
  static const categoryUrl = "$baseUrl/api/v1/categorys";
  static const getAllCategory = "$categoryUrl/getAllCategorys";

    ////////////brand endpoints
  static const getAllProductsByBrand = "$productUrl/fetchProducts/byBrand/";
  static const brandUrl = "$baseUrl/api/v1/brands";
  static const getAllBrand = "$brandUrl/getAllBrands";

  /////////////// order endpoint 
  static const orderUrl = "$baseUrl/api/v1/order";
  static const creatOrder = "$orderUrl/myOrder/create";
  static const getAllOrders = "$orderUrl/fetchUserOrder/allOrder";




  ////////////cart end points
  static const cartUrl = "$baseUrl/api/v1/cart";
  static const addToCart = "$cartUrl/addToCart/add";
  static const fetchUserCart = "$cartUrl/fetchUserCart/";
  static const deletUserCart = "$cartUrl/removeFromCart";

  // http://localhost:4000/api/v1/cart/fetchUserCart/646640371e052ce3ce53a3a5
}
