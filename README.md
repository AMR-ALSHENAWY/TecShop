# TecShop : Electronics Shoping

## TecShop is a *small open source* version of Mercado app (E-commerce application)

<a href="https://play.google.com/store/apps/details?id=tecshop.com">
<img src="images/downloadAndroid.png"  width="250">  
</a> 

<table style="width:100%" >
  
  <tr> 
   <th>   <h2>Authentication Screen</h2>   </th> 
  <tr/>
  <tr>
    <th><img src="images/1..auth.jpg"  width="370"></th>
  </tr>
  

  <tr>  
   <th>   <h2>Home Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/3.home.jpg"  width="370"></th>
  </tr>
  
  
  <tr>  
   <th>   <h2>Category Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/2.category.jpg"  width="370"></th>
  </tr>
  
  
  <tr>  
   <th>   <h2>Favorite Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/4.favorite.jpg"  width="370"></th>
  </tr>
  
  
  <tr>  
   <th>   <h2>Cart Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/5.cart.jpg"  width="370"></th>
  </tr>
  
   
   
  <tr>  
   <th>   <h2>Offer Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/6.offers.jpg"  width="370"></th>
  </tr>


  <tr>  
   <th>   <h2>ProductDetails Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/7.productDetails.jpg"  width="370"></th>
  </tr>
  
      
 
  <tr>  
   <th>   <h2>Orders Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/8.orders.jpg"  width="370"></th>
  </tr>
  
   
  <tr>  
   <th>   <h2>OrderDetails Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/9.orderDetails.jpg"  width="370"></th>
  </tr>
  
  <tr>  
   <th>   <h2>Profile Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/10.profile.jpg"  width="370"></th>
  </tr>
    
  <tr>  
   <th>   <h2>EditProfile Screen</h2> </th>
  <tr/>
  <tr>
   <th><img src="images/11.editProfile.jpg"  width="370"></th>
  </tr>  
  
  
</table>

# Directory Structure
## (Files with X mark are not exist )>> contact me for complete access.

<pre>
<code>
lib
|
│───config
|    └──route.dart
|    |──changeNotifierProviders.dart
|    |──enums.dart
|    └──apiConstants.dart
|
│───floating
|    └──bottomNavigationBarContent.dart
|
│───globalWidgets
|    │──appBars.dart
|    │──backBtnPop.dart
|    │──cartBadge.dart
|    │──circleIcon.dart
|    |──EmptyMessage.dart
|    |──goToLabelArrow.dart
|    |──headerWithLead.dart
|    |──headerWithTail.dart
|    |──iconLabelButton.dart
|    |──offerBatch.dart
|    └──txtField.dart
|
│───mainScreens
|    │──authScreen.dart
|    |──cartScreen.dart
|    |──contactUsScreen.dart
|    |──editProfileScreen.dart
|    |──favoriteScreen.dart
|    |──homeScreenContent.dart
|    |──homeScreenRoot.dart
|    |──offerProductScreen.dart
|    |──orderScreen.dart
|    |──productDetailsScreen.dart
|    |──productScreen.dart
|    |──profile|Screen.dart
|    |──showImageScreen.dart
|    └──splashScreen.dart
|
│───models
|    │──cartApiModel.dart
|    |──categoryModel.dart
|    |──checkItemModel.dart
|    |──httpException.dart
|    |──offerModel.dart
|    |──orderModel.dart -----------------X 
|    |──productModel.dart
|    |──userAuthDataModel.dart
|    └──userModel.dart ------------------X
|
│───providers
|    │──authProvider.dart ---------------X
|    |──cartProvider.dart ---------------X
|    |──categoryProvider.dart
|    |──favoriteProvider.dart
|    |──genderProvider.dart
|    |──homeScreenProvider.dart ---------X
|    |──offerProvider.dart
|    |──orderProvider.dart
|    |──productProvider.dart
|    └──userProvider.dart
|
│───ScreenWidgets
|   |
|   |───authScreen ----------------------X
|   |   |──authForm.dart
|   |   └──components.dart
|   |      |
|   |      |──emailField.dart
|   |      |──logoCard.dart
|   |      |──passwordField.dart
|   |      └──roundButton.dart
|   |
|   |───cartScreen
|   |   |──cartItem.dart
|   |   └──completeOrderBtn.dart
|   |   └──dismissibleBg.dart
|   |
|   |
|   |───contactUsScreen
|   |   |──contactIconRow.dart
|   |   └──contactIcon.dart
|   |   └──mercadoBtn.dart
|   |
|   |───editProfileScreen
|   |   |──checkItemWidget.dart
|   |   └──chooseGenderType.dart
|   |
|   |
|   |───favoriteScreen
|   |   └──favoriteProductGrid.dart
|   |
|   |───homeScreen
|   |   |──categoryElement.dart
|   |   └──categoryList.dart
|   |   └──titleHeader.dart
|   |   └──titleHeaderSimple.dart
|   |
|   |
|   |───offerScreen
|   |   └──offerGridProducts.dart
|   |   └──carouselComponents.dart
|   |      └─carouselDemo.dart
|   |      └──slideElement.dart
|   |
|   |
|   |
|   |───orderScreen ---------------------X
|   |   |──orderDetailsBsheet.dart
|   |   └──orderItem.dart
|   |   └──orderProductDetails.dart
|   |   └──orderProductList.dart
|   |
|   |
|   |
|   |───product
|   |   |──bottomButton.dart
|   |   └──cartButton.dart
|   |   └──favoriteButton.dart
|   |   └──productGridItem.dart
|   |   └──productItem.dart
|   |   └──productPrice.dart
|   |   └──shareButton.dart
|   |
|   |
|   |───productDetailsScreen
|   |   |──brandNameAndPrice.dart
|   |   └──errorContainer.dart
|   |   └──productDetails.dart
|   |
|   |
|   |───profileScreen
|   |   |──gotoBtnCard.dart
|   |   └──profileScreenItems.dart
|   |
|   |
|   └───themes
|       |──lightColor.dart
|       |──theme.dart
|       └──productDetails.dart
| 
|
│───main.dart
└───generalFunctions.dart


</code>
</pre>

# Features : 

    
- Powerfull user experience and user interface.
- Responsive app for mobiles and small tablets.
- Complete authentication system.
- Complete admin panel for:
    - Adding multiple categories.
    - CRUD operation for Categories.
    - CRUD operation for Products.
    - Product can belong to multiple categories.

- Favorite basket.
- Shopping cart.
- Profile editing .
- ordering system .
- State management with Provider.
- Complete back end system using Node.js with express.
- Mongo db for database.
- Clean Code and Structure.
     

# TecShop is a Small Version of Mercado App

<a href="https://play.google.com/store/apps/details?id=mercado.com">
<img src="images/mercadoLogo.jpg"  width="200">  
</a> 

<a href="https://play.google.com/store/apps/details?id=mercado.com">
<img src="images/googlePlay.jpg"  width="200">  
</a> 

# Youtube Mercado video

<a href="https://www.youtube.com/watch?v=QdMxpiPmBIk&ab_channel=AMRELSHENAWY">
<img src="images/youtube.png"  width="80">  
</a> 


# Follow Me 
<table>
  <tr>
  <th>
    <a href="https://www.linkedin.com/in/amr-alshenawy">
      <img src="images/linkedin.png"  width="60"> 
    </a>
    </th>
   
   
   <th>
    <a href="https://www.facebook.com/eng.amr.alshenawy">
      <img src="images/facebook.png"  width="60"> 
    </a>
    </th>
    
   <th>
    <a href="https://wa.me/+201067316151">
      <img src="images/whatsapp.png"  width="60"> 
    </a>
   </th>
  </tr>
</table>
