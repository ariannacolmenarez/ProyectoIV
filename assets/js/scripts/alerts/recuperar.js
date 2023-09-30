$(document).ready(function() {

    $("#recuperarform").validate({
        rules: {
            usuario : {
                required: true,
                minlength: 5,
                maxlength: 50
            },
            password: {
                minlength : 5,
                required: {
                    depends: function(elem) {
                        return $("#password").val() != "" || $("#usuario").val() != ""
                    }
                    },
                equalTo : "#usuario"
            },
        },
        errorElement : 'span'
    });
});
function validacion(tipo,titulo,texto){
    Swal.fire({
        icon: tipo,
        title: titulo,
        text: texto,
      })
}

$("#submit").on("click", function(){
    if ($('#recuperarform').valid()) {
        $('#recuperarform').submit();  
    }
   return true;
});