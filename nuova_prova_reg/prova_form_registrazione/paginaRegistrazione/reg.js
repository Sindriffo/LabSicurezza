function CHECK() {
   let name = document.getElementById("name").value;
   let password = document.getElementById("password").value;
   let bassword = document.getElementById("bassword").value;
   let email=document.getElementById("email").value;
   let number=document.getElementById("number").value;
   let surname=document.getElementById("surname").value;

   

   if(name == ""){
      window.alert("perfavore inserisci il tuo nome.");
      name.focus;
      return false;
   }

   var re = /^\w+$/;
   if(!re.test(name)) {
     alert("il nome può contenere soltato caratteri alfabetici");
     name.focus;
     return false;
   }
   if(surname== ""){
      window.alert("perfavore inserisci il tuo cognome.");
      name.focus;
      return false;
   }

   var mailformat= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   if(!mailformat.test(email)){
      alert("Inserire una mail valida");
      email.focus;
      return false;
}

   

   if (password.length <6 ) {
      alert("la password deve essere lunga almeno 6 caratteri");
      return false;
      
   }
    var paswd=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if(!paswd.test(password)) {
       alert ("la password deve contenere almeno una lettera maiuscola, una minuscola ed un numero")
       password.focus;
       return false;
    }

   if(password!= bassword ){
      window.alert("le due password non coincidono");
      return false;
   }

  
    
    if(number.length<12){
      alert("inserire un numero di telefono corretto");
      number.focus;
      return false;
    }
    


   return true;
   }

