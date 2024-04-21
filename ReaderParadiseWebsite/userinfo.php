<?php
session_start();

if (isset($_SESSION['email'])) {
    
    $userEmail = $_SESSION['email'];
    $userFirstName = $_SESSION['firstname'];
    $userLastName = $_SESSION['lastname'];

    echo "<body>";
    echo "<form style=\"color:white\">";
    echo "<fieldset><legend><h1><Strong>User Info<Strong></h1></legend>";
    echo "<h2><Strong>User Email: </Strong>" . $userEmail."</h2><br>";
    echo "<h2><Strong>User FirstName: </Strong>" . $userFirstName."</h2><br>";
    echo "<h2><Strong>User LastName: </Strong>". $userLastName."</h2><br>";
    echo "<h2><a href=\"HomePage.php\">Go Back to Home Page!</a></h2>";
    echo "</fieldset>";
    echo "<form>";
    echo "</body>";
} else {
    header("Location: HomePage.php");
    exit();
}
?>