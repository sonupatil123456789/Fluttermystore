class ApiEndpointsUrl {
  // static const baseUrl = "http://192.168.43.188";      // 192.168.1.5
  static const baseUrl = "http://192.168.1.4:4000";

  ////////////authantication endpoints
  static const authUrl = "$baseUrl/api/v1/auth";

  static const loginUrl = "$authUrl/login";
  static const registerUrl = "$authUrl/regiester/new";
  static const verifyUserUrl = "$authUrl/mydata/";

  
  ////////////category endpoints
  static const productUrl = "$baseUrl/api/v1/products";
  static const getAllProducts = "$productUrl/fetchAllProducts";

  ////////////product endpoints
  ///http://localhost:4000/api/v1/categorys/getAllCategorys
  static const categoryUrl = "$baseUrl/api/v1/categorys";
  static const getAllCategory = "$categoryUrl/getAllCategorys";
  static const searchProducts = "$productUrl/fetchAllProducts/filter/search/";

  

  ////////////cart end points
  static const cartUrl = "$baseUrl/api/v1/cart";
  static const addToCart = "$cartUrl/addToCart/add";
  static const fetchUserCart = "$cartUrl/fetchUserCart/";
  static const deletUserCart = "$cartUrl/removeFromCart";

   

  // http://localhost:4000/api/v1/cart/fetchUserCart/646640371e052ce3ce53a3a5
}
