-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
tabuleiro = require("tabuleiro")

--Jogador
jogador = "X"

mensagem = ""

resultadoJogada = false

function novoJogo()
    --Botao novo jogo
    buttonNovoJogo = display.newRect(160, 400, 150, 50)
    buttonNovoJogo:setFillColor(1, 1, 1)
    texto = {x=165, y=400, text="Novo Jogo"}
    local textoBotao = display.newText(texto)
    textoBotao:setTextColor(0, 0, 0)

    function buttonNovoJogo:touch(event)
        if event.phase == "began" then
            jogador = "X"
            tabuleiro:zerarTabuleiro()
            display.remove(mensagem)
            mensagem = ""
            iniciar()
            return true
        end
    end

    buttonNovoJogo:addEventListener("touch", buttonNovoJogo)
end

--Verifica quem ta jogando
function jogadorVez()
    --Verifica o jogador e passa vez para o outro
    if (jogador == "X") then
        jogador = "O"
    else
        jogador = "X"
    end

end

--Iniciar uma nova partida
function iniciar()
    --Mostra tabuleiro vazio
    tabuleiro:mostrarTabuleiro()
    --Criar botao
    criarBotao()
    --Chamar evento do botao
    eventoBotao()

end

--Metodo que verifica a partida
function verificarJogo()
    if (tabuleiro:vencedor()) then
        if (mensagem == "") then
            mensagem = display.newText("Parabens o jogador "..jogador.." venceu!", 150, 300, native.systemFont, 20)
            mensagem:setFillColor(1,1,1)
        end
    --Mostra uma mensagem de empate caso nao haja vencedor
    elseif (tabuleiro:empate()) then
        mensagem = display.newText("Deu VELHA a partida foi empatada.", 150, 300, native.systemFont, 18)
        mensagem:setFillColor(1,1,1)
    else
        --Proximo da vez
        jogadorVez()
    end
end

function criarBotao() 
	button1 = display.newRect(50, 35, 90, 70)
	button1:setFillColor(0, 0, 0)

	button2 = display.newRect(150, 35, 90, 70)
	button2:setFillColor(0, 0, 0)

	button3 = display.newRect(250, 35, 90, 70)
	button3:setFillColor(0, 0, 0)

	button4 = display.newRect(50, 110, 90, 70)
	button4:setFillColor(0, 0, 0)

	button5 = display.newRect(150, 110, 90, 70)
	button5:setFillColor(0, 0, 0)

	button6 = display.newRect(250, 110, 90, 70)
	button6:setFillColor(0, 0, 0)

	button7 = display.newRect(50, 190, 90, 65)
	button7:setFillColor(0, 0, 0)

	button8 = display.newRect(150, 190, 90, 65)
	button8:setFillColor(0, 0, 0)

	button9 = display.newRect(250, 190, 90, 65)
	button9:setFillColor(0, 0, 0)
end

function eventoBotao()
	function button1:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(1, jogador) then
                verificarJogo()
            end

			return true
		end
		
	end

	function button2:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(2, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button3:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(3, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button4:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(4, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button5:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(5, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button6:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(6, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button7:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(7, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button8:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(8, jogador) then
                verificarJogo()
            end
			return true
		end
		
	end

	function button9:touch(event)
		if event.phase == "began" then
            if tabuleiro:realizarJogada(9, jogador) then
                verificarJogo()
            end
			return true
		end
		
    end

	button1:addEventListener("touch", button1)
	button2:addEventListener("touch", button2)
	button3:addEventListener("touch", button3)
	button4:addEventListener("touch", button4)
	button5:addEventListener("touch", button5)
	button6:addEventListener("touch", button6)
	button7:addEventListener("touch", button7)
	button8:addEventListener("touch", button8)
    button9:addEventListener("touch", button9)
end

novoJogo()
