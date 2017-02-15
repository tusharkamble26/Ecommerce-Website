<?php

try {
  $dbh = new PDO("mysql:host=127.0.0.1;dbname=cheapbooks","root","password",array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
session_start();

$dbh->beginTransaction();


//If user clicks on Log out button
if(isset($_POST['logOut']))
{
	// remove all session variables
    session_unset();

   // destroy the session
    session_destroy(); 
   
   header('location:index.php');
}
?>



<!DOCTYPE html>

<html lang="en">
<head>
  <title>Welcome</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

 </head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle"
data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Shop @ CheapBooks</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="#">Home</a></li>
        <li><a href="#">About Us</a></li>
      </ul>
      <div id="navbar" class="navbar-collapse collapse">
        <form class="navbar-form navbar-right"  method="POST" >
            <div class="form-group">
	        <button type="submit" class="btn btn-info btn-lg" name="logOut"><span class="glyphicon glyphicon-log-out"></span> Log Out</button>
          </div>
		  </form>
        </div>
    </div>
  </div>
</nav>

<!-- End of header -->
 <br /><br />
    <div class="topSpacing"></div>
    
<!-- Search buttons -->
<div class="container">
        <div class="col-lg-12">
            <h1 style="display:inline">Search</h1>
			
			<div class="pull-right">
            <p class="lead snipp-title">
	    		<a href="checkout.php" class="btn btn-default" role="button"><span class="glyphicon glyphicon-shopping-cart"></span> (<?php if(isset($_SESSION["shopping_cart"]))echo count($_SESSION["shopping_cart"]); else echo '0';?>) Shopping Basket</a>
	    	</p>
			</div>
			
            <div class="highlight">
			<div class="well">
			<form method="POST">
                <!--Title text box-->                 
				<input type="text" id="search" name="search" class="form-control" >
                
                <br />

                <!--Filter button-->
				
				<button type="submit" class="btn btn-primary" name="btnAuthor">SearchByAuthor</button> 
                <button type="submit" class="btn btn-primary" name="btnTitle">SearchByBookTitle</button> <br>
            </form>
            <!--End of col-lg-12 highlight-->
            </div>
            
		</div>
	</div>


<?php

if(isset($_POST['btnAuthor']) || isset($_POST['btnTitle'])) {

if(isset($_POST['btnAuthor']))
 $stmt = $dbh->prepare("SELECT `author`.`name`, `book`.* FROM `author` LEFT JOIN `writtenby` ON `author`.`SSN` = `writtenby`.`SSN` LEFT JOIN `book` ON `writtenby`.`ISBN` = `book`.`ISBN` WHERE (( `name` LIKE '%".$_POST['search']."%'))");
else if(isset($_POST['btnTitle']))
 $stmt=$dbh->prepare("SELECT * FROM `book` WHERE `title` LIKE '%".$_POST['search']."%'"); 
 
 
 $stmt->execute();
 $bookStock;
  
  while ($row = $stmt->fetch()) {
	  
	  //Query to find total stock
	  $stmtStock = $dbh->prepare("SELECT SUM(`number`) as stock FROM `stocks` WHERE `ISBN` LIKE '".$row['ISBN']."'");
	  $stmtStock->execute(); 
	  while ($result = $stmtStock->fetch()){
		 $bookStock=$result['stock'];
	  }
	 
	 if($bookStock>0)
	 {
    	?>
	<div class = "col-sm-3 ">
							<form method="POST">
                            
                            <div style = "border:1px solid #333;background-color:#f1f1f1;border-radius:5px;padding:16px;" >
							
							<div style="margin-top:5px;margin-bottom:5px">
                           <!--Book image-->
                           <center>  <a href="#">
                           <img src="book.jpeg" alt="Book" class="thumbnail singlePaintingByArtistIMG" width="80%"/>
		                   </a></center>
                           </div>
                            
                           <!--Book info-->
						   <div style = "text-align:center;width:100%;height:60px">
                          <a href="#"><?php echo "Book name: ".$row['title']." ,<br />ISBN: ".$row['ISBN']." ,<br />Total Stock: ".$bookStock.",<br />Price: $".$row['price'] ?></a> 
                          </div>
                            <br />
                            <!--ArtWork buttons-->
							<div style="margin-bottom:5px;">
                          <center>                           
						   <!--Quantity-->
                            <div class="highlight">
                             <input type="text" name="quantity"  class="form-control" value="0" /> 
							
							 </div> 
                            <!--Wish link-->
                          <input type="hidden" name="hidden_title" value=<?php echo $row['title'] ?> />
						  <input type="hidden" name="hidden_ISBN" value=<?php echo $row['ISBN'] ?> />
						  <input type="hidden" name="hidden_price" value=<?php echo $row['price'] ?> />
						  
                           <button type="submit" class="btn btn-primary" name="add_to_cart" style="margin-top:5px;"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</button> 
                         </center> 
						 
                        <!--End of thumbnail-->
						</div>
						</div>
						</form>
                        </div>
	
	<?php
	 }
  }

}

if(isset($_POST['add_to_cart']))
{
	 
	  
	
if(isset($_SESSION["shopping_cart"]))
{
	
	$count=count($_SESSION["shopping_cart"]);
	$item_array=array(
	'item_isbn' => $_POST['hidden_ISBN'],
	'item_title' => $_POST['hidden_title'],
	'item_price' => $_POST['hidden_price'],
	'item_quantity' => $_POST['quantity']
	
	);
	$_SESSION["shopping_cart"][$count]=$item_array;
	echo '<script type="application/javascript">alert("Item is added into the cart!"); window.location.href = "welcome.php";</script>';

	
}else
{
	
	$item_array=array(
	'item_isbn' => $_POST['hidden_ISBN'],
	'item_title' => $_POST['hidden_title'],
	'item_price' => $_POST['hidden_price'],
	'item_quantity' => $_POST['quantity']
	
	);
	$_SESSION["shopping_cart"][0]=$item_array;
	echo '<script type="application/javascript">alert("Item is added into the cart!"); window.location.href = "welcome.php";</script>';
	
}
}

}catch (PDOException $e) {
  print "Error!: " . $e->getMessage() . "<br/>";
  die();
}
?>


<!-- end div of container -->	
</div>

<!-- End Search buttons -->