<!DOCTYPE html>
<html>
    <head>
        <title>User Login Form</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .error {
                color: #FF0000;
            }
            body {
                background-image: url('image1.jpg');
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                overflow-x: hidden;
                height: 100vh;

            }
            form {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                font-size: 22px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);

            }

            fieldset {
                text-align: left;
            }

            legend {
                text-align: center;
            }

            input {
                font-size: 22px !important;
                width: 100%;
                box-sizing: border-box;
                margin-bottom: 10px;
            }
            #sb{
                font-size: 22px;
            }

        </style>
    </head>
    <body> 

        <p><span class="error">* required field</span></p>
        <form method="post" action="AccountCreationValidation.php"> 
            <fieldset> <legend><h3> Create Account </h3></legend>
                <p><span class="error">* required field</span></p>
                First Name: <span class="error">* </span>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>"><br>
                <span class="error"><?php echo $firstnameErr; ?></span>
                <br>

                Last Name:<span class="error">* </span>
                <input type="text" name="lastname" value="<?php echo $lastname; ?>"><br>
                <span class="error"> <?php echo $lastnameErr; ?></span>
                <br>

                E-mail: <span class="error">* </span>
                <input type="text" name="email" value="<?php echo $email; ?>"><br>
                <span class="error"> <?php echo $emailErr; ?></span>
                <br>

                Phone: <input type="text" name="phone" value="<?php echo $phone; ?>"><br>
                <span class="error"><?php echo $phoneErr; ?></span>
                <br>

                Password: <span class="error">* </span>
                <input type="password" name="password" value="<?php echo $password; ?>"><br>
                <span class="error"> <?php echo $passwordErr; ?></span>
                <br>

                Confirm Password:<span class="error">* </span>
                <input type="password" name="confirmpassword" value="<?php echo $confirmpassword; ?>"><br>
                <span class="error"><?php echo $confirmpasswordErr; ?></span>
                <br>
                <input type="hidden" name="validated" value="<?php echo $validated; ?>">
                <input type="submit" name="createAccount" value="Create Account"> 

            </fieldset>
            <a href="Login.php"> Go back to login</a>
        </form>

    </body>
</html>