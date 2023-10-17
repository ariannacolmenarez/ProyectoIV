$(document).ready(function() {
    $("#userform").validate({
        rules: {
            passAntiguo: {
                required: true,
                minlength: 5,
                maxlength: 50
            },
            pass1: {
                required: true,
                minlength: 5,
                maxlength: 50
            },
            pass2: {
                required: true,
                minlength: 5,
                maxlength: 50,
                equalTo: "#pass1"  // Comparar con el campo pass1
            }
        },
        errorElement: 'span',
        messages: {
            pass2: {
                equalTo: "Las contraseñas deben coincidir" // Mensaje de error personalizado
            }
        }
    });
    
    $.ajax({
        type: "POST",
        url: "preguntaSeguridad/listarPreguntas",
        dataType: "html",
        success: function (response) {
            $("#pregunta1").html(response);
            $("#pregunta2").html(response);
            $("#pregunta3").html(response);
        },
        error: (response) => {
            console.log(response);
        }
    });
});
var toastMixin = Swal.mixin({
    toast: true,
    icon: 'success',
    title: 'General Title',
    animation: false,
    position: 'top-right',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
});
function validacion(tipo,titulo,texto){
    Swal.fire({
        icon: tipo,
        title: titulo,
        text: texto,
      })
}
function actualizarPass(){
    var passAntiguo = $("#passAntiguo").val();
    var pass1 = $("#pass1").val();
    var pass2 = $("#pass2").val();


    var parametros = {
        "passAntiguo" : passAntiguo,
        "pass1" : pass1,
        "pass2" : pass2
    };
    if ($('#userform').valid()) {
        $.ajax({
            data:  parametros, //datos que se envian a traves de ajax
            url:   'cambioPass/cambio', //archivo que recibe la peticion
            type:  'POST', //método de envio
            success:  function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve
                    const buscarError = "error_contrasena_actual";
                    const buscarPalabra = "cambio_existoso";
                    console.log(response);
                    if (response.indexOf(buscarError) !== -1) {
                        console.log(response);
                        validacion("error","Error","La contraseña actual no es correcta"); 
                    }
                    if(response.indexOf(buscarPalabra) !== -1){
                        console.log(response);
                        toastMixin.fire({
                            animation: true,
                            title: 'Ajustes listos'
                        });

                        setTimeout(function() {
                                // Redirigir a 'balance' después de 2 segundos
                                document.location.href='balance';
                        }, 3000);
                        
                    }
                
            },error: (response) => {
                console.log(response);
            }
        });
    } else {
        validacion("error","Error","Rellena los campos correctamente");
    }
   
}