const emailRegex = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]/i;
const numRegex = /\(\d\d\)\s\d\d\d\d\d-\d\d\d\d/;

function verifyEmail() {
    let email;
    email = cadastro.email.value;
    if (emailRegex.test(email)) {
        cadastro.email.style = 'border-color: green!important;';
        verify();
        return true;
    } else
        if (email === '') {
            document.querySelector('#email').removeAttribute('style');
            return false;
        } else {
            cadastro.email.style = 'border-color: red!important;';
            return false;
        }
}

function verifyNumber() {
    let numero;
    numero = cadastro.numero.value;
    if (numRegex.test(numero)) {
        cadastro.numero.style = 'border-color: green!important;';
        verify();
        return true;
    } else
        if (numero === '') {
            document.querySelector('#numero').removeAttribute('style');
            return false;
        } else {
            cadastro.numero.style = 'border-color: red!important;';
            return false;
        }
}

function verify() {
    let nome = cadastro.nome.value;
    let email = cadastro.email.value;
    let numero = cadastro.numero.value;
    if (nome !== '' && email !== '' && numero !== '') {
        if (emailRegex.test(email) && numRegex.test(numero)) {
            document.querySelector('#enviar').disabled = false;
        }else {
        document.querySelector('#enviar').disabled = true;
    }
    } else {
        document.querySelector('#enviar').disabled = true;
    }
}

function clean() {
    document.querySelector('#numero').removeAttribute('style');
    document.querySelector('#email').removeAttribute('style');
}

function formatarNumero() {
    let num = cadastro.numero.value;
    num = num.replace(/\D/g, '');

    if (num.length < 11) {
        cadastro.numero.value = num.replace(/^(\d{2})(\d{5})(\d{4})$/, '($1) $2-$3');
    }else{
        cadastro.numero.value = num.slice(0,11).replace(/^(\d{2})(\d{5})(\d{4})$/, '($1) $2-$3');
    }
    verifyNumber();
}