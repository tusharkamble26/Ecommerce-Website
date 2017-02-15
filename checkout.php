<!DOCTYPE html>
<?php

try {
$dbh = new PDO("mysql:host=127.0.0.1;dbname=cheapbooks","root","password",array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
session_start();


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
  <title>Checkout</title>
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
        <li ><a href="welcome.php">Home</a></li>
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


<body>






<div class="container">
<h1>Shopping Cart  </h1><a class="btn btn-primary" href="welcome.php">Continue Shopping</a>
<form method="POST">
<hr>
<table class="table table-striped table-hover table-bordered">
<tbody>
<tr>
<th>Book Title</th>
<th>QTY</th>
<th>Unit Price</th>
<th>Total Price</th>
<th>Action</th>
</tr>
<tr>

<?php

if(!empty($_SESSION["shopping_cart"]))
{
	$total=0;
	
	foreach($_SESSION["shopping_cart"] as $keys => $values)
	{
	 	
		?>
	

<td><?php echo $values['item_title']."  ,ISBN: ".$values['item_isbn'] ?></td>
<td>
<?php echo $values["item_quantity"] ?>
<a href="#">X</a>
</td>
<td><?php echo $values["item_price"] ?></td>
<td><?php  echo number_format($values["item_quantity"] * $values["item_price"],2);
      
	  $total= $total+ ($values["item_quantity"] * $values["item_price"]);
	  
 ?></td>
 
 <td><button type="button" class="btn btn-danger">Remove(Dummy)</button>
</tr>
<?php
	}
	?>

<tr>
<th colspan="3">
<span class="pull-right">Total</span>
</th>
<th>$<?php echo number_format($total,2); ?></th>
</tr>




<tr>
<td>
<a class="btn btn-primary" href="welcome.php">Continue Shopping</a>
</td>
<td colspan="3">
<button type="submit" class="pull-right btn btn-success" name="btnCheckOut">Buy</button> 

</td>
</tr>
</tbody>
</table>
</form>
</div>



<?php

if(isset($_POST['btnCheckOut']))
{ 
   
	if(!empty($_SESSION["shopping_cart"]))
	{
	//Creating BasketID
	$stmtBasket = $dbh->prepare('insert into ShoppingBasket  values("Null","'.$_SESSION['username'].'")');
    $stmtBasket->execute();
		
		foreach($_SESSION["shopping_cart"] as $keys => $values)
	{
	$dbh->beginTransaction();
	
	
	
	// Retrieve customer basketID
    $stmtGetBID = $dbh->prepare('SELECT * FROM ShoppingBasket where `username`="'.$_SESSION['username'].'"');
    $stmtGetBID->execute();
    while ($row = $stmtGetBID->fetch()) {
    $_SESSION['basketID']=$row['basketId'];   
    }
	
	
	 $stmtStock = $dbh->prepare("SELECT * FROM `stocks` WHERE `ISBN` LIKE '".$values['item_isbn']."'");
	
	  $stmtStock->execute();
     
    while ($result = $stmtStock->fetch()){
		 if($values["item_quantity"]<=$result['number'])
		 {

			 
			 //Update Contains table
			 $stmtUpdateContains = $dbh->prepare('insert into Contains  values("'.$values['item_isbn'].'","'.$_SESSION['basketID'].'","'.$values["item_quantity"].'")');
             $stmtUpdateContains->execute();
			 
			 
			 
			 //Filling shipping information
			 $stmt = $dbh->prepare('insert into ShippingOrder   values("'.$values['item_isbn'].'","'.$result['warehouseCode'].'","'.$_SESSION['username'].'","'.$values["item_quantity"].'")');
             $stmt->execute();
			 
			 
			 //Update stock in the warehouse
			 $stmtStockUpdate = $dbh->prepare("UPDATE `stocks` SET `number` = '".($result['number']-$values['item_quantity'])."' WHERE `stocks`.`warehouseCode` = '".$result['warehouseCode']."' AND `stocks`.`ISBN`='".$values['item_isbn']."'");
             $stmtStockUpdate->execute();
			 
			 
             
			  $dbh->commit();
			 break;
		 }
		 
	  }
	  
	 
    
	
	}
	}
	$tempUserName= $_SESSION['username'];
	// remove all session variables
    session_unset();

   // destroy the session
   session_destroy(); 
   
   
   session_start();
   $_SESSION['username']=$tempUserName;
		echo '<script type="application/javascript">alert("Items will be shipped soon"); window.location.href = "welcome.php";</script>';
	
}

}


}catch (PDOException $e) {
  print "Error!: " . $e->getMessage() . "<br/>";
  die();
}
?>

</body>
</html>