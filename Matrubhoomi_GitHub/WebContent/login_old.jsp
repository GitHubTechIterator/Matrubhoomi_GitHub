<!doctype html>
<html lang="en-US">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>Matrubhoomi - Login</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="shortcut icon" href="http://static.tmimgcdn.com/img/favicon.ico">
  <link rel="icon" href="http://static.tmimgcdn.com/img/favicon.ico">
  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css">
  <script type="text/javascript" src="Js/switchery.min.js"></script>
</head>

<body>

  <div id="wrapper">
  
  <h1>Get Access</h1>
  
  <form action="ControllerServlet" method="post">
   
    <label>
      <input type="hidden" name="pagename" value="login.jsp">
    </label>
  
  <div class="col-2">
    <label>
      Username 
      <input placeholder="Username" id="username" name="username" tabindex="1">
    </label>
  </div>
  <div class="col-2">
    <label>
      Password
      <input placeholder="Password" type="password" id="password" name="password" tabindex="2">
    </label>
  </div>
  <div class="col-submit">
    <button  type="submit" class="submitbtn">Sign in</button>
  </div>
  
  </form>
  </div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
</script>

</body>
</html>