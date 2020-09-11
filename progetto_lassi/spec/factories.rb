FactoryBot.define do
  
  
  
    factory :user do
        email {"prova@example.com"}
        nome {"Prova"}
        cognome {"Prova"}
        password {"Topolino1."}
        telefono {"1234567890"}
    end

  factory :travel do
    user_id {0}
    partenza {"Roma"}
    arrivo {"Napoli"}
    prezzo {15}
    data {"24/12/2020"}
    ora_partenza {"10:00"}
    posti_disponibili {3}
end
   end
