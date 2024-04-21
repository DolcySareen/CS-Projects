<?php

session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emailErr = $passwordErr = "";
    $email = $password = "";
    $validated = "yes";

    if (empty($_POST["email"])) {
        $validated = "no";
        $emailErr = "Email is required.";
    } else {
        $email = test_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $validated = "no";
            $emailErr = "Invalid email format.";
        }
    }

    if (empty($_POST["password"])) {
        $validated = "no";
        $passwordErr = "Password is required.";
    } else {
        $password = test_input($_POST["password"]);
    }

    if ($validated == "no") {
        include('Login.php');
        exit();
    } else if ($validated == "yes") {
        $mysqli = mysqli_connect("localhost", "cs213user", "letmein", "testDB");

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        } else {
            $targetname = filter_input(INPUT_POST, 'email');
            $lc = strtolower($targetname);
            $targetPassword = filter_input(INPUT_POST, 'password');
            $sql = "SELECT * FROM USERS WHERE email = '" . $lc . "' AND password = '" . $targetPassword . "'";

            $result = mysqli_query($mysqli, $sql) or die(mysqli_error($mysqli));

            if (mysqli_num_rows($result) === 1) {
                $userDetails = mysqli_fetch_assoc($result);
                $_SESSION['email'] = $userDetails['email'];
                $_SESSION['firstname'] = $userDetails['firstname'];
                $_SESSION['lastname'] = $userDetails['lastname'];
                header("Location: HomePage.php");
            } else {
                echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>";
                echo "<script>alert(\"No such user exist!\")</script>";
                include('Login.php');
            }

            mysqli_close($mysqli);
            exit();
        }
    }
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

?>
