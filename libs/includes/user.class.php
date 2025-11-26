<?php

class User
{
    private $conn;
    private $username;
    private $id;

    public function __call($name, $arguments)
    {
        // Handle dynamic method calls if needed
     
       $prorerty = preg_replace("/[^0-9a-zA-Z]/", "",substr($name,3));
       $prorerty = strtolower(preg_replace('/\B([A-Z])/', '_$1', $prorerty));
      

       if (substr($name, 0, 3) === 'get') {
           return $this->_get_data($prorerty);
       } elseif (substr($name, 0, 3) === 'set') {
              return $this->_set_data($prorerty, $arguments[0]);
         } else {
              throw new BadMethodCallException("Method $name does not exist.");
         }
        

    }
    //private static $salt = "auths@!#2024"; // Static salt for hashing
    public static function singup($Username, $Password, $email, $phone)
    {

        //$Password = md5(strrev(md5($Password)) . User::$salt); // Security Through Obscurity
        $options = [
            // Increase the bcrypt cost from 12 to 13.
            'cost' => 9,
        ];
        $Password = password_hash($Password, PASSWORD_BCRYPT, $options);


        $conn = Database::getConnction();


        $sql = "INSERT INTO `auth` (`id`, `username`, `password`, `email`, `phone`, `blocked`, `active`) 
VALUES (NULL, '$Username', '$Password', '$email', '$phone', '0', '0')";

        $error = false;

        if ($conn->query($sql) === TRUE) {
            $error = false;
        } else {
            //echo "Error: " . $sql . "<br>" . $conn->error;
            $error = $conn->error;
        }

        $conn->close();

        return $error;
    }

    public static function login($Username, $Password)
    {
        //$Password = md5(strrev(md5($Password)) . User::$salt); // Security Through Obscurity

        $query = "SELECT * FROM auth WHERE username = '$Username'";
        $conn = Database::getConnction();
        $result = $conn->query($query);

        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if (password_verify($Password, $row['password'])) {
                return $row['username'];
            } else {
                return false;
            }
        } else {
            return false;


        }


    }




    public function __construct($Username)
    {
        $this->conn = Database::getConnction();
        $this->username = $Username;
        $this->id = null;

        $sql = "SELECT `id` FROM auth WHERE username = '$Username' LIMIT 1"; 
        $result = $this->conn->query($sql);
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $this->id = $row['id'];
        }else {
            throw new Exception("User not found."); 
        }

    }

    private function _get_data($var)
    {
      if (!$this->conn) {
            $this->conn = Database::getConnction();    
      }
        $sql = "SELECT `$var` FROM users WHERE id = '$this->id' ";
        $result = $this->conn->query($sql);
        if ($result and $result->num_rows == 1) {
            return $result->fetch_assoc()[$var];
        } else {
            return null;
        }
        
    }
    
    private function _set_data($var, $data) {
      if (!$this->conn) {
            $this->conn = Database::getConnction();    
      }
        $sql = "UPDATE `users` SET `$var` = '$data' WHERE `id` = '$this->id' ";
        if ($this->conn->query($sql)) {
            return true;
        } else {
            return false;
        }
        
    }


    public function getUsername()
    {
        return $this->username;
    }
    public static function authenticate()
    {

    }

    // public static function getBio()
    // {

    // }

    // public static function setBio()
    // {

    // }

    // public static function getAvatar()
    // {

    // }

    // public static function setAvatar()
    // {

    // }
}


?>