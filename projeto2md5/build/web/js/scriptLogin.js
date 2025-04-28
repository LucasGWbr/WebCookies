
function verify() {
    let nome = login.nome.value;
    let pass = login.pass.value;
    if (nome !== '' && pass!== '' ) {
        document.querySelector('#enviar').disabled = false;
    } else {
        document.querySelector('#enviar').disabled = true;
    }
}
