namespace :dev do

  PASSWORD_DEFAULT = 123123

  desc "Configura o Ambiente"
  task setup: :environment do
    puts "Executando o Bundle Install "
    puts %x(bundle install)
    puts "APAGANDO A BASE DE DADOS "
    puts %x(rails db:drop)
    puts "CRIANDO BANCO DE DADOS"
    puts %x(rails db:create)
    puts "MIGRANDO OS MODELS PARA O BANCO DE DADOS"
    puts %x(rails db:migrate)
    puts "CADASTRANDO USUARIO ADMIN"
    
    Employee.create!(
      name: "Cleniosvaldo Jodércio de Lima e Couto Júnior", 
      age: 45, 
      user: User.create!(
              email: "t@t.com", 
              password: PASSWORD_DEFAULT, 
              password_confirmation: PASSWORD_DEFAULT, 
              function: 0)
      )
    
    puts "Usuario:#{User.last.email} - Senha: #{PASSWORD_DEFAULT}"
    puts "---------------------------------------------------------"
  end

end
