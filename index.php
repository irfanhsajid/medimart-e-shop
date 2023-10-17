<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_GET['user_id'])){
   $user_id = $_GET['user_id'];
   setcookie('user_id', $user_id, time() + (86400 * 30), "/"); // set the cookie for 30 days
}

include 'components/add_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>
<body>

<?php include 'components/user_header.php'; ?>



<section class="hero">

   <div class="swiper hero-slider">

      <div class="swiper-wrapper">

         <div class="swiper-slide slide">
            
            <div class="content">
               
               <span> Flat <span style="color:red;">30%</span> Off </span>
               <h3 data-aos="fade-right"
               data-aos-duration="1200">Brand New Medical Books</h3>
               <a href="products.php" class="btn">view products</a>
            </div>
            <div class="image">
               <img src = "images/banner-img3.png" alt=" image will be added">
            </div>
            
         </div>

         <div class="swiper-slide slide">
            <div class="content">
               <span>order online</span>
               <h3>Medical Accesssories</h3>
               <a href="products.php" class="btn">view products</a>
            </div>
            <div class="image">
               <img src="images/banner-img2.png" alt="image will be added">
            </div>
         </div>

         <div class="swiper-slide slide">
            <div class="content">
               <span>order online</span>
               <h3>Used Products</h3>
               <a href="products.php" class="btn">view products</a>
            </div>
            <div class="image">
               <img src="images/banner-img1.png" alt="image will be added">
            </div>
         </div>

      </div>

      <div class="swiper-pagination"></div>

   </div>
</section>
<br>

<!-- SVG Wave  -->
<svg viewbox="0 0 1440 320" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <path id='sineWave' fill="#0099ff" fill-opacity="0.2" d="M0,160 C320,300,420,300,740,160 C1060,20,1120,20,1440,160 V0 H0" />
  </defs>
  <use class="wave" href="#sineWave" />
  <use class="wave" x="-100%" href="#sineWave" />
  <use class="wave1" href="#sineWave" />
  <use class="wave1" x="-100%" href="#sineWave" />
  <use class="wave2" href="#sineWave" />
  <use class="wave2" x="-100%" href="#sineWave" />
</svg>

<section class="category">

   <h1 class="title" data-aos="fade-left" data-aos-duration="1100">Explore Categories</h1>

   <div class="box-container" data-aos="zoom-out" data-aos-duration="1000">

      <a href="category.php?category=used" class="box">
         <img src="images/used-products.jpg" alt="">
         <h3>used</h3>
      </a>

      <a href="category.php?category=new" class="box">
         <img src="images/new-products.jpg" alt="">
         <h3>brand new</h3>
      </a>

      <a href="category.php?category=swapable" class="box">
         <img src="images/swapable-products.jpg" alt="">
         <h3>Swapable</h3>
      </a>

      <a href="category.php?category=gadgets" class="box">
         <img src="images/gadgets.jpg" alt="">
         <h3>Gadgets</h3>
      </a>

   </div>

</section>




<section class="products">

   <h1 class="title" data-aos="fade-right"
   data-aos-duration="1000">Bunch of Products</h1>

   <div class="box-container" >

      <?php
         $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6");
         $select_products->execute();
         if($select_products->rowCount() > 0){
            while($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)){
      ?>
      <form action="" method="post" class="box" data-aos="zoom-in-down" data-aos-duration="1000">
         <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
         <input type="hidden" name="name" value="<?= $fetch_products['name']; ?>">
         <input type="hidden" name="price" value="<?= $fetch_products['price']; ?>">
         <input type="hidden" name="image" value="<?= $fetch_products['image']; ?>">
         <a href="quick_view.php?pid=<?= $fetch_products['id']; ?>" class="fas fa-eye"></a>
         <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
         <img src="uploaded_img/<?= $fetch_products['image']; ?>" alt="">
         <a href="category.php?category=<?= $fetch_products['category']; ?>" class="cat"><?= $fetch_products['category']; ?></a>
         <div class="name"><?= $fetch_products['name']; ?></div>
         <div class="flex">
            <div class="price"><?= $fetch_products['price']; ?><span>/-</span></div>
            <input type="number" name="qty" class="qty" min="1" max="99" value="1" maxlength="2">
         </div>
      </form>
      <?php
            }
         }else{
            echo '<p class="empty">no products added yet!</p>';
         }
      ?>

   </div>

   <div class="more-btn">
      <a href="products.php" class="btn">veiw all</a>
   </div>

</section>

<?php include 'components/footer.php'; ?>

<!-- aos js cdn -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".hero-slider", {
   loop:true,
   grabCursor: true,
   effect: "flip",
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
});

</script>

</body>
</html>