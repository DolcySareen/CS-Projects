<!DOCTYPE HTML>  
<html>
    <head>
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
                font-size: 30px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);

            }

            fieldset {
                text-align: left;
            }

            legend {
                text-align: center;
            }

            input {
                font-size: 25px !important;
                width: 100%;
                box-sizing: border-box;
                margin-bottom: 10px;
            }
            #sb{
                font-size: 30px;
            }

        </style>
    </head>
    <body>  
        <form method="post" action="userLoginValidation.php">
            <fieldset> <legend><h3> Login Form </h3></legend>
                <p><span class="error">* required field</span></p>
                Email:<span class="error">* </span>
                <input type="text" name="email" value="<?php echo $email; ?>">
                <br><span class="error"> <?php echo $emailErr; ?></span>
                <br><br>
                Password: <span class="error">*</span>
                <input type="password" name="password" value="<?php echo $password ?>">
                <br><span class="error"> <?php echo $passwordErr; ?></span>
                <br><br>
                <input type="hidden" name="validated" value="<?php echo $validated; ?>">
                <input id="sb" type="submit" name="submit" value="Login">  
            </fieldset>
            <br>
            <a href="CreateAccount.php">Create Library Account</a>
        </form>
    </body>
</html>




