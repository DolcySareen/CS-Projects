<?php

session_start();
$mysqli = mysqli_connect("localhost", "cs213user", "letmein", "testDB");

$targetbtypes = filter_input(INPUT_POST, 'options');
$sql1 = "SELECT b.book_id, b.book_name,  b.purchase_price, b.rental_price, b.book_type, a.author_name
         FROM BOOKS b, AUTHORS a 
         WHERE b.author_id = a.author_id AND
               b.book_type = '" . $targetbtypes . "'";
$result1 = mysqli_query($mysqli, $sql1) or die(mysqli_error($mysqli));

$targetauthors = filter_input(INPUT_POST, 'authors');
$sql2 = "SELECT b.book_id, b.book_name,  b.purchase_price, b.rental_price, b.book_type, a.author_name
         FROM BOOKS b, AUTHORS a
         WHERE b.author_id = a.author_id AND
               a.author_name = '" . $targetauthors . "'";
$result2 = mysqli_query($mysqli, $sql2) or die(mysqli_error($mysqli));

$targetbooks = filter_input(INPUT_POST, 'books');
$lc = strtolower($targetbooks);
$sql3 = "SELECT b.book_id, b.book_name,  b.purchase_price, b.rental_price, b.book_type, a.author_name
         FROM BOOKS b, AUTHORS a
         WHERE b.author_id = a.author_id AND
               (b.book_name = '" . $lc . "' OR b.book_name = '" . $targetbooks . "')";
$result3 = mysqli_query($mysqli, $sql3) or die(mysqli_error($mysqli));

if (mysqli_num_rows($result1) > 0 || mysqli_num_rows($result2) > 0 || mysqli_num_rows($result3) > 0) {
    if (mysqli_num_rows($result1) > 0) {
        echo "<p><h1 style=\"background-color: black\"><em><Strong>These are the $targetbtypes books:</Strong></em></h1></p>";
        echo "<hr>";
        while ($info = mysqli_fetch_array($result1)) {
            echo  "<Strong>". $info['book_id'] ."</Strong><h2><Strong> Book name: <Strong></h2>" . "<Strong><h2>\"". $info['book_name'] . "\"</h2></Strong><br><Strong>Purchase Price: $" . $info['purchase_price'] . "<br>" .
            "</Strong> <strong>Rental Price: $" . $info['rental_price'] . " </strong>" . "<br>" . "(" . $info['book_type'] . ")<br>Author name: " . $info['author_name'] . "<br>";
            echo "<hr>";
        }
    }
    if (mysqli_num_rows($result2) > 0) {
        echo "<p><h1 style=\"background-color: black\"><em><Strong>These are the books by $targetauthors:</Strong></em></h1></p>";
        echo "<hr>";
        while ($info = mysqli_fetch_array($result2)) {
            echo  "<Strong>". $info['book_id'] ."</Strong><h2><Strong> Book name: <Strong></h2>" . "<Strong><h2>\"". $info['book_name'] . "\"</h2></Strong><br><Strong>Purchase Price: $" . $info['purchase_price'] . "<br>" .
            "</Strong> <strong>Rental Price: $" . $info['rental_price'] . " </strong>" . "<br>" . "(" . $info['book_type'] . ")<br>Author name: " . $info['author_name'] . "<br>";
            echo "<hr>";
        }
    }
    if (mysqli_num_rows($result3) > 0) {
        echo "<p><h1 style=\"background-color: black\"><em><Strong>Here is your book:</Strong></em></h1></p>";
        echo "<hr>";
        while ($info = mysqli_fetch_array($result3)) {
            echo  "<Strong>". $info['book_id'] ."</Strong><h2><Strong> Book name: <Strong></h2>" . "<Strong><h2>\"". $info['book_name'] . "\"</h2></Strong><br><Strong>Purchase Price: $" . $info['purchase_price'] . "<br>" .
            "</Strong> <strong>Rental Price: $" . $info['rental_price'] . " </strong>" . "<br>" . "(" . $info['book_type'] . ")<br>Author name: " . $info['author_name'] . "<br>";
            echo "<hr>";
        }
    }
} else {
    echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>";
    echo "<script>alert(\"Select the book type, author or type in the book name!\");</script>";
    include('HomePage.php');
    exit;
}
?>