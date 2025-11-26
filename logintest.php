<?php

//include './libs/load.php';

include 'libs/load.php';

$user = "test01";
$pass = "1234";
$result = null;

if(isset($_GET['logout'])){
    Session::destroy();
    die("Session Destroyed <br> <br> <a href='logintest.php'>Login Again </a> ");
}

if (Session::get('is_loggedin')) {
    $userdata = Session::get('session_user');
    $userobj = new User($userdata);
    print_r($userdata);
    print_r($userobj);
    print("Welcome Back, " . $userobj -> getfirstname ());
    print("<br>" . $userobj -> getBio ());
    $userobj -> setBio ("This is my new bio set at/" . $userobj -> getUsername () );
    $userobj -> setfacebook ("https://facebook.com/" . $userobj -> getUsername () );
     print("<br>" . $userobj -> getfacebook ());
    $result = $userdata;
} else {
    print ("No Session Found, trying to login now.<br>");
    $result = User::login($user, $pass);
    //print_r($result);

    if ($result) {
        $userobj = new User($user);

        echo "Login successful! " . $userobj -> getUsername ();
        Session::set('is_loggedin', true);
        Session::set('session_user', $result);
    } else {
        echo "Invalid username or password.";
    }
}

echo <<< EOL
<br><br><a href="logintest.php?logout">Logout</a>
EOL


?>