    
<?php

session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $firstnameErr = $lastnameErr = $emailErr = $phoneErr = $passwordErr = $confirmpasswordErr = "";
    $firstname = $lastname = $email = $phone = $password = $confirmpassword = "";
    $validated = "no";

    if (empty($_POST["firstname"])) {
        $firstnameErr = "First Name is required.";
    } else {
        $firstname = test_input($_POST["firstname"]);
        if (!preg_match("/^[a-zA-Z ]*$/", $firstname)) {
            $firstnameErr = "Only letters and white space allowed.";
        }
    }

    if (empty($_POST["lastname"])) {
        $lastnameErr = "Last Name is required.";
    } else {
        $lastname = test_input($_POST["lastname"]);
        if (!preg_match("/^[a-zA-Z ]*$/", $lastname)) {
            $lastnameErr = "Only letters and white space allowed.";
        }
    }

    if (empty($_POST["email"])) {
        $emailErr = "Email is required.";
    } else {
        $email = test_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format.";
        }
    }

    if (!empty($_POST["phone"])) {
        $phone = test_input($_POST["phone"]);
        if (!preg_match("/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/", $phone)) {
            $phoneErr = "Invalid phone number.";
        }
    }

    if (empty($_POST["password"])) {
        $passwordErr = "Password is required.";
    } else {
        $password = test_input($_POST["password"]);
        $pattern = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_!@#$%^&*])[a-zA-Z\d_!@#$%^&*]{8,}$/';

        if (!preg_match($pattern, $password)) {
            $passwordErr = "Password should be combination of letters, digits, or the specified special characters, with a minimum length of 8 characters.";
        }
    }

    if (empty($_POST["confirmpassword"])) {
        $confirmpasswordErr = "Confirm Password is required.";
    } else {
        $confirmpassword = test_input($_POST["confirmpassword"]);
        if ($confirmpassword !== $password) {
            $confirmpasswordErr = "Password must be valid and confirm password should match with it.";
        }
    }

    if (empty($firstnameErr) && empty($lastnameErr) && empty($emailErr) && empty($phoneErr) && empty($passwordErr) && empty($confirmpasswordErr)) {
        $validated = "yes";
    } else {
        $validated = "no";
    }

    if ($validated == "no") {
        include('CreateAccount.php');
        exit();
    } else if ($validated == "yes") {
        $mysqli = mysqli_connect("localhost", "cs213user", "letmein", "testDB");

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        } else {
            $targetname = filter_input(INPUT_POST, 'email');
            $lc = strtolower($targetname);
            $sql = "SELECT * FROM USERS WHERE email = '" . $lc . "' ";

            $result = mysqli_query($mysqli, $sql) or die(mysqli_error($mysqli));

            if (mysqli_num_rows($result) === 0) {
                $r1 = true;
            } else {
                $r1 = false;
                echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>";
                echo "<script>alert(\"Account already exists!\")</script>";
                include('CreateAccount.php');
            }
        }
        if ($r1 === TRUE) {
            $sql1 = "INSERT INTO USERS VALUES ('" . $_POST["firstname"] . "', '" . $_POST["lastname"] . "', '" . $lc . "', '" . $_POST["phone"] . "', '" . $_POST["password"] . "');";
            $res = mysqli_query($mysqli, $sql1) or die(mysqli_error($mysqli));
            echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>";
            echo "<script>alert(\"Account has been created!\")</script>";
            include('Login.php');
        }
        mysqli_close($mysqli);
        exit();
    }
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>  
