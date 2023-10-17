<?php
include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/add_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>search page</title>
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>
<body>
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->

<!-- search form section starts  -->
<section class="search-form" data-aos="zoom-in" data-aos-duration="700">
   <form action="" method="post" > 
      <!-- implementing livesearch here -->
      <input type="text" name="search-box" placeholder="search product name, price, category..." class="box" id="live_search_field" autocomplete="off">
      <button class="fas fa-search"></button>
   </form>
</section>
<!-- search form section ends -->



   <!-- live search result -->
<div id="search-result"></div>

<!-- custom js file link  -->

<script src="js/script.js"></script>
<!-- jquery Cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
   $(document).ready(function(){
      $("#live_search_field").keyup(function(){
         var input = $(this).val();
         //alert(input);

         if(input != ""){
            $.ajax({
               url:"livesearch.php",
               method:"POST",
               data:{input:input},
               success:function(data){
                  $("#search-result").html(data);
               }
            })
         }else{
            $("#search-result").html("<p>Search by any category, name or price! </p>");
         }
      })
   });
</script>

<!-- aos js cdn -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>


</body>
</html>


