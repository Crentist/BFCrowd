var app_id = '864102200328600';
var scopes = 'email, user_friends, user_online_presence';

var btn_login = "<div id='facebook-profile' style='text-align: center;'>"
	+ 	' <a  "href="#" onclick="FB.login();" class="btn btn-primary" style="text-align: center;">Iniciar Sesi&oacute;n con Facebook</a>';
	+ "</div>";

var btn_permission = 
	"<div id='facebook-profile' style='text-align: center;'>"
	+ 	' <a  "href="#" onclick="FB.login();" class="btn btn-primary" style="text-align: center;">Dar permisos a Facebook</a>';
	+ "</div>";

var btn_signin = "<div id='facebook-profile' style='text-align: center;'>"
		+ 	' <a  "href="#" onclick="FB.login();" class="btn btn-primary" style="text-align: center;">Registrarse con Facebook</a>';
		+ "</div>";

// Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
	FB.init({
		appId : app_id,
		cookie : true, // enable cookies to allow the server to access the
		// session
		xfbml : true, // parse social plugins on this page
		version : 'v2.2' // use version 2.2
	});

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	}
	
	);
	
};

// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	if (response.status === 'connected') {
		getFacebookProfilebf();
	} else if (response.status === 'not_authorized') {
		showSignInButton();
	} else {
		// sino muestra el boton de login
		showLoginButton();
		// window.location.href="login.html";
	}
}

function getFacebookProfile() {
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			FB.api('/me',function(response) {
				$('#Content').prepend(div_profile);
//				$('body').prepend(div_profile);
				$('#name').text("Nombre: " + response.name);
				$('#email').text("Email: " + response.email);
				$('#facebook-profile img').attr('src','http://graph.facebook.com/'+ response.id+ '/picture?type=normal');
				$('#controller').text("id: " + response.name);

			});
			} else {
					showLoginButton();
				}
			});
}

var showLoginButton = function() {
	$('#Content').prepend(btn_login);
	//document.getElementById("div_facebook").innerHTML = btn_login;
}
	
var showLoginForm = function() {
	FB.api('/me',function(response) {
		$('#idFacebook').val(response.id);
	});
}
var showSignInButton = function() {
	$('#Content').prepend(btn_signin);
}

var div_profile = "<div id='facebook-profile' style='text-align: center;'>"
		+ "<img id='img_perfil' style='margin: 0 auto;border-radius: 10px;'></img>"
		+ "<br>"
		+ "<strong id='name'></strong> "
		+ "<br>"
		+ "<strong id='email'></strong>"
		+ "<br>"
		+ "<strong id='controller'></strong>"
		+ "<br>"
		+ "<a style='margin: 10px' href='#' onclick='facebookPost()' id='publicar' class='btn btn-primary'>Publicar prueba</a>"
		+ "<br>"
		+ "<a style='margin: 10px' href='#' id='login' class='btn btn-primary' onclick='FB.logout()'> Logout</a>";
		+ "<strong id='controller'></strong> "
		+ "</div>"


// funcion que postea en el muro del usuario: "esto es una prueba"
var facebookPost = function() {
	FB.login(function() {
		FB.api('/me/feed', 'post', {
			message : 'esto es una prueba!'
		});
	}, {
		scope : 'publish_actions'
	});
}

