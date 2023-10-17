$(document).ready(function() {
    $("#userform").validate({
        rules: {
        respuesta1 : {
            required: true,
            minlength: 5,
            maxlength: 50
        },
        respuesta2: {
            required: true,
            minlength: 5,
            maxlength: 50
        },
        respuesta3: {
            required: true,
            minlength: 5,
            maxlength: 50
        }
        },
        errorElement : 'span'
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
function registarRespuestas(){
    var pregunta1 = $("#pregunta1").val();
    var pregunta2 = $("#pregunta2").val();
    var pregunta3 = $("#pregunta3").val();
    var respuesta1 = $("#respuesta1").val();
    var respuesta2 = $("#respuesta2").val();
    var respuesta3 = $("#respuesta3").val();

    var parametros = {
        "pregunta1" : pregunta1,
        "pregunta2" : pregunta2,
        "pregunta3" : pregunta3,
        "respuesta1" : respuesta1,
        "respuesta2" : respuesta2,
        "respuesta3" : respuesta3
    };
    if ($('#userform').valid()) {
        if(pregunta1 != pregunta2 && pregunta1 != pregunta3 && pregunta2 != pregunta3){
        
            $.ajax({
                data:  parametros, //datos que se envian a traves de ajax
                url:   'preguntaSeguridad/respuesta', //archivo que recibe la peticion
                type:  'POST', //método de envio
                success:  function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve
                    if(response){
                        const buscarError = "error_respuesta_existe";
                        const buscarPalabra = "registro_existoso";
                        if (response.indexOf(buscarError) !== -1) {
                            console.log(response);
                            validacion("error","Error","Este usuario ya tiene respuestas de seguridad"); 
                        }
                        if(response.indexOf(buscarPalabra) !== -1){
                            console.log(response);
                            toastMixin.fire({
                                animation: true,
                                title: 'Preguntas de seguridad registradas exitosamente'
                            });
                            setTimeout(function() {
                                // Redirigir a 'balance' después de segundos
                                document.location.href='cambioPass';
                        }, 3000);
                        }
                       
                    }else{
                        
                        validacion("error","Error","Escritura de la respuesta errónea");  
                    }
                },error: (response) => {
                    console.log(response);
                }
            });
        
        }else{
            validacion("error","Error","Las preguntas no se pueden repetir");  
        }
    } else {
        validacion("error","Error","Rellena los campos correctamente");
    }
   
}