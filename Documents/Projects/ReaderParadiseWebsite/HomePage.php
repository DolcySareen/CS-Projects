<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="HomePage.css">
    </head>
    <body>
        <header style="background-color: white">
            <button id="signin">Switch User</button>
            <button id="logout">Logout</button>
            <button id="userinfo">User Info</button>
        </header>
        <div> 
            <img src = "reader.png" name = "img" id = "img">

            <b><i style="color: black">'Welcome to Reader's Paradise!'</i></b>

        </div>
        <div>
            <button id= "home">Home</button>
            <button id= "about">About Us</button>
            <button id= "cite" >Cite Sources</button>
            <button id= "ask" >Ask Via E-Mail</button>
            <button id= "rate" >Provide Ratings</button>
        </div>  
        <main id = "div2" style="color: white">
            <form method="post" action="query.php">
                <fieldset> <legend><h1> Find Your Book! </h1></legend>
                    <h2>Search By Book Type:</h2>
                    <p>
                        <select name="options" size ="1" style="font-size:20px">
                            <option value="" disabled selected hidden>Select a book type!</option>
                            <option value="Fictional">Fictional</option>
                            <option value="Non-Fictional">Non-Fictional</option>
                            <option value="Romantic">Romantic</option>
                            <option value="Comics">Comics</option>
                        </select>
                    </p>

                    <h2>Search By Author:<h2>
                            <p>
                                <select name="authors" size ="1" style="font-size:20px">
                                    <option value="" disabled selected hidden>Select an author name!</option>
                                    <option value="Nicholas Sparks">Nicholas Sparks</option>
                                    <option value="Jane Austen">Jane Austen</option>
                                    <option value="George Orwell">George Orwell</option>
                                    <option value="J.K. Rowling">J.K. Rowling</option>
                                    <option value="Margaret Atwood">Margaret Atwood</option>
                                    <option value="Malcolm Gladwell">Malcolm Gladwell</option>
                                    <option value="Michelle Obama">Michelle Obama</option>
                                    <option value="Yuval Noah Harari">Yuval Noah Harari</option>
                                    <option value="Stan Lee">Stan Lee</option>
                                    <option value="Alan Moore">Alan Moore</option>
                                    <option value="Marjane Satrapi">Marjane Satrapi</option>

                                </select>
                            </p>
                            <h2>Search by Book Name:</h2>
                            <p>
                                <input style="font-size:20px" type = "text" id = "book" name="books" placeholder= "Search for book here!">
                            </p>
                            <br>
                            <input style="font-size:30px" id="sb1" type="submit" name="submit" value="Go!!!"> 
                            <img src = "book.jpg" name = "img1" id = "img1">
                            </fieldset>
                            </form>
                            </main>
                            </body>
                            </html>

                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $("#about").on("click", function () {
                                        $("#div2").load("about.php");
                                    });
                                    $("#cite").on("click", function () {
                                        $("#div2").load("Cite.php");
                                    });

                                    $("#signin").on("click", function () {
                                        $("body").load("Login.php");
                                    });
                                    
                                     $("#userinfo").on("click", function () {
                                        $("body").load("userinfo.php");
                                    });

                                    $("#logout").on("click", function () {
                                        alert("You are signed out");
                                        $("body").load("Login.php");
                                    });

                                    $("#ask").on("click", function () {
                                        $("#div2").load("Ask.html");
                                    });

                                    $("#sb1").on("click", function (event) {
                                        event.preventDefault();

                                        var formData = $('form').serialize();

                                        $.ajax({
                                            url: "query.php",
                                            type: "POST",
                                            data: formData,
                                            success: function (data) {
                                                $("#div2").html(data);
                                            },
                                            error: function (xhr, status, error) {
                                                console.error("Error loading query.php:", error);
                                            }
                                        });
                                    });

                                    $("#home").on("click", function () {
                                        $("body").load("HomePage.php");
                                    });


                                    $("#rate").on("click", function () {

                                        var userInput = prompt("Please enter your rating from 1 to 5:");

                                        if (userInput === null) {
                                            alert("User clicked Cancel or closed the prompt.");
                                        } else {
                                            userInput = parseFloat(userInput);

                                            if (!isNaN(userInput) && userInput >= 1 && userInput <= 5) {
                                                alert("Thank you for rating us!");
                                            } else {
                                                alert("Please provide a valid rating between 1 and 5!");
                                            }
                                        }
                                    });

                                });
                            </script>
