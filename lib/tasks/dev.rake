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
    User.create!(
      email: 'estagio@hc.com', 
      name: 'Clevinalson Lima de Castro Silva e Melo',
      password: PASSWORD_DEFAULT, 
      password_confirmation: PASSWORD_DEFAULT
    )
    puts "Usuario:#{User.last.email} - Senha: #{PASSWORD_DEFAULT}"
    puts "---------------------------------------------------------"
  end

end
