window.addEventListener('load', function(){
    let formulario = document.getElementById('createAdmin');
    let ulErrores = document.getElementById('errores');

    formulario.addEventListener('submit', function(evento){
        if(!validaciones(evento)){
            return evento.preventDefault();//si las validaciones NO estan OK, se indica q NO se envíe el formulario y se que en este lugar con el preventDefault
        }else{
            return formulario.submit(); //si las validaciones fueron OK, enviar el formulario
        }
    })
    function validaciones(evento){
        //con destructuring de codigo se declaran todas las variables y se igualan al elemento capturado (formulario), las variables usan el name del formulario y se colocan de manera ordenada a como estan en los inputs del form
        let {equipo, estadio, precio, descripcion, imagen} = formulario.elements;
        let errores = []; //se declara array de errores
        ulErrores.classList.add('alert-danger');
    
        //validar el equipo
        if(equipo.value == ''){
            errores.push('Indique el equipo de fútbol');
            equipo.classList.add('is-invalid');
            equipo.classList.remove('is-valid');
        }else{
            equipo.classList.add('is-valid');
            equipo.classList.remove('is-invalid');
        }

        //validar estadio
        if(estadio.value == ''){
            errores.push('Indique el nombre del estadio');
            estadio.classList.add('is-invalid');
            estadio.classList.remove('is-valid');
        }else{
            estadio.classList.add('is-valid');
            estadio.classList.remove('is-invalid');
        }

        //validar precio
        if(precio.value == ''){
            errores.push('Indique el precio');
            precio.classList.add('is-invalid');
            precio.classList.remove('is-valid');
        }else{
            precio.classList.add('is-valid');
            precio.classList.remove('is-invalid');
        }

        //validar descripción
        if(descripcion.value == ''){
            errores.push('Indique la descripción');
            descripcion.classList.add('is-invalid');
            descripcion.classList.remove('is-valid');
        }else{
            descripcion.classList.add('is-valid');
            descripcion.classList.remove('is-invalid');
        }

        if(errores.length > 0){
            ulErrores.innerHTML = ''; //LIMPIO LOS ERRORES Y LUEGO LO LLENO
            for(let i = 0; i < errores.length; i++){
                ulErrores.innerHTML += `<li> ${errores[i]}</li>`;
            }
        }else{
            return true;
        }
    }

})