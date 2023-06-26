math.randomseed(os.time())

-- Aline Gouveia (amtg)
-- II Exercício Escolar - PLC (Q4)

function atacar () 
    ataque = math.random(1, 20)
    if ataque >= 1 and ataque <= 10 then
        return "Choque do trovão", 50
    elseif ataque >= 11 and ataque <= 15 then
        return "Calda de ferro", 100
    elseif ataque >= 16 and ataque <= 18 then
        return "Investida trovão", 150
    end

    return "Trovão", 200
end

function batalha (vida_atual, dano_levado)
    while true do
        vida_atual = vida_atual - dano_levado

        nome_ataque, dano_ataque = atacar()

        vida_atual, dano_levado = coroutine.yield(vida_atual, nome_ataque, dano_ataque)
    end
end

pikachu_coroutine = coroutine.create(batalha)
raichu_coroutine = coroutine.create(batalha)

vida_pikachu = 800
vida_raichu = 1000
ataque_raichu = 0

while vida_pikachu > 0 and vida_raichu > 0 do
    status, vida_pikachu, nome_ataque_pikachu, ataque_pikachu = coroutine.resume(pikachu_coroutine, vida_pikachu, ataque_raichu)
    
    print("Vida pikachu", vida_pikachu)
    if vida_pikachu <= 0 then
        print("\n🪦  Pikachu foi derrotado! O vencedor foi Raichu!")
        break
    end
    print("\n⚡ Pikachu usou", nome_ataque_pikachu, ataque_pikachu)
    
    status, vida_raichu, nome_ataque_raichu, ataque_raichu = coroutine.resume(raichu_coroutine, vida_raichu, ataque_pikachu)
    print("Vida raichu", vida_raichu)
    if vida_raichu <= 0 then
        print("\n🪦  Raichu foi derrotado! O vencedor foi Pikachu!")
        break
    end
    print("\n⚡ Raichu usou", nome_ataque_raichu, ataque_raichu)
end