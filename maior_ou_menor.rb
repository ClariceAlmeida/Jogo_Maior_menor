#função simples
def boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é seu nome?"
    nome = gets.strip
    puts "\n\n"
    puts "Vamos começar a jogar, #{nome}" 
end

def pede_dificuldade
    puts "Selecione o nível de dificuldade:" 
    puts " (1) Muito Fácil (2) Fácil (3) Normal (4) Difícil (5) Muito Difícil"
    dificuldade = gets.to_i
end

#função com retorno
def sorteia_numero (dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4 
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "O número foi escolhido... adivinhe o número secreto"
    puts "\n\n"
    sorteado
end
#função com parâmetros
def pede_numero (chutes, tentativa, limite_de_tentativas)
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora = #{chutes}"
    puts "Digite o número"
    puts "\n\n"
    chute = gets.strip
    puts "Você chutou #{chute}. Será que é o número secreto?"
    chute.to_i
end

def verifica_se_acertou (numero_secreto, chute)
    acertou = numero_secreto == chute.to_i 

    if acertou 
        puts "Acertou!"
        return true
    end  
    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número é menor!" 
    end
    false
end

def joga (nome)

    dificuldade = pede_dificuldade
    # esse trecho atribui o retorno da função sorteia_numero (retorna oq está na última linha) para a váriavel numero_secreto
    numero_secreto = sorteia_numero (dificuldade)

    pontos_ate_agora = 1000

    #limite de tentativas é umaváriavel para evitar o uso de magic numbers (números que estão no código "soltos")
    limite_de_tentativas = 5

    chutes = []

    #tentativa é uma variável que vai de um número à outro para que o laço se repita 
    for tentativa in 1..limite_de_tentativas

        

        chute = pede_numero(chutes, tentativa, limite_de_tentativas)
        chutes << chute 
    
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder

        # valida se acertou o número
        # acertou vai guardar uma validação e retornar um valor booleano, o if vai condicionar se true ou else para false
        if verifica_se_acertou(numero_secreto, chute)
            break
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "\n\n"
    puts "Quer jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = boas_vindas 


loop do
    joga (nome)
    if nao_quer_jogar?
        break
    end
end

