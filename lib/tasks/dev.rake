namespace :dev do

  PASSWORD_DEFAULT = 123456

  desc "Configura o Ambiente"
  task setup: :environment do
    puts "APAGANDO A BASE DE DADOS "
    puts %x(rails db:drop)
    puts "CRIANDO BANCO DE DADOS"
    puts %x(rails db:create)
    puts "MIGRANDO OS MODELS PARA O BANCO DE DADOS"
    puts %x(rails db:migrate)
    User.create!(
      email: 'estagio@hc.com', 
      password: PASSWORD_DEFAULT, 
      password_confirmation: PASSWORD_DEFAULT
    )
    puts "Usuario:#{User.last.email} - Senha: #{PASSWORD_DEFAULT}"
    puts "---------------------------------------------------------"
  end

end
