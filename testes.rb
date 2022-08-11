#arrays
chutes = [1, 4, 5, 8, 9]

# imprimindo um número do array 
puts chutes [0] 

#atribui um número numa posição do array
chutes [5] = 200
puts chutes [5]


#inicia um array vazio
chutes []
# atribui um numero a chute
chute = 176
# inicia a tentativa valendo 1
tentativa = 1
# atribui o chute à posição 0 do array chutes
chutes [tentativa -1] = chute

# faz a mesma coisa só que atribuindo a posição 1 do array = segunda tentativa
chute = 100
tentativa = 2
chutes [tentativa -1] = chute

# o tamano do array se da pela tentativa

for contador in 1..tentativa
    puts "Chute = " + chutes[contador -1].to_s
end


# percorrer cada elemento dentro do array e mostrar 
for chute in chutes
    puts chute
end

# colocar um número na última posição do array automaticamente
chute = 134
chutes << chute

#como saber o tamanho do array
puts chutes.size