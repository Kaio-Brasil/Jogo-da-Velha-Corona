--Construir uma tabela 3x3
tabuleiro = {
				{" "," "," "},
				{" "," "," "},
				{" "," "," "}
			}

--Cria um  novo tabuleiro
function tabuleiro:novotabuleiro()
	--Criar um novo tabuleiro ou seja uma nova instancia
	local nTabuleiro = {}
	-- Novo tabuleiro herda de tabuleiro
	setmetatable(nTabuleiro, {__index = tabuleiro})
	--Retorna um novo tabuleiro
	return nTabuleiro
end

--Verifica se todos elementos de uma linha, coluna e diagonas sao iguais.
function tabuleiro:vencedor()
	for i = 1, 3 do
		--verificar linhas
		if (((self[i][1] == self[i][2]) and (self[i][3] == self[i][1])) and (self[i][2] ~= " ")) then
			return true
		end

		--verificar colunas
		if (((self[1][i] == self[2][i]) and (self[3][i] == self[2][i])) and (self[2][i] ~= " ")) then
			return true
		end

	end

	--verificar diagonais da esquerda para direita e direita para esquerda
	if ((((self[1][1] == self[2][2]) and (self[3][3] == self[2][2])) and (self[2][2] ~= " " )) or 
		((self[1][3] == self[2][2]) and (self[3][1] == self[2][2])) and (self[2][2] ~= " " )) then
		return true
	end

	return false

end

--Verifica se nao houve ganhador e caso o elemento da linha ou da coluna for igual, ele retorna verdadeiro
function tabuleiro:empate()
	for i = 1, 3, 1 do
		for j = 1, 3, 1 do
			if (self[i][j] == " ") then
				return false
			end

		end

	end

	return true

end

--Verifica se a jogada e valida, caso jogue em mesmo posicao sera pedido que jogue novamento.
function tabuleiro:realizarJogada(posicao, simbolo)
	if ((posicao == 1) and self[1][1] == " ") then
		self:desenhar11(simbolo)
	elseif ((posicao == 2) and self[1][2] == " ") then
		self:desenhar12(simbolo)
	elseif ((posicao == 3) and self[1][3] == " ") then
		self:desenhar13(simbolo)
	elseif ((posicao == 4) and self[2][1] == " ") then
		self:desenhar21(simbolo)
	elseif ((posicao == 5) and self[2][2] == " ") then
		self:desenhar22(simbolo)
	elseif ((posicao == 6) and self[2][3] == " ") then
		self:desenhar23(simbolo)
	elseif ((posicao == 7) and self[3][1] == " ") then
		self:desenhar31(simbolo)
	elseif ((posicao == 8) and self[3][2] == " ") then
		self:desenhar32(simbolo)
	elseif ((posicao == 9) and self[3][3] == " ") then
		self:desenhar33(simbolo)
	else
		--Retorna falso se a posicao ja foi preenchida
		return false
	end

	--Retorna verdadeiro se o tabuleiro receber um simbolo
	return true

end

--Contrucao do tabueiro
function tabuleiro:mostrarTabuleiro()
	--criar linhas verticais do tabuleiro
	display.newLine(100, 0, 100, 225)
	display.newLine(200, 225, 200, 0)
	
	--criar linha horizontais do tabuleiro
	display.newLine(0, 70, 300, 70)
	display.newLine(0, 150, 300, 150)
end

--Limpar todos os campos do tabuleiro
function tabuleiro:zerarTabuleiro()
	for i = 1, 3, 1 do
		for j = 1, 3, 1 do
			self[i][j] = " "
		end

	end

end

--função desenha o elemento
function tabuleiro:desenhar11(simbolo)
	self[1][1] = simbolo

    if simbolo == "X" then
        x = display.newLine(10, 10, 90, 65)
        y = display.newLine(90, 10, 10, 65)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(50, 35, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(50, 35, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar12(simbolo)
	self[1][2] = simbolo

    if simbolo == "X" then
        x = display.newLine(110, 10, 190, 65)
        y = display.newLine(190, 10, 110, 65)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(152, 35, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(152, 35, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar13(simbolo)
	self[1][3] = simbolo

    if simbolo == "X" then
        x = display.newLine(210, 10, 290, 65)
        y = display.newLine(290, 10, 210, 65)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
    else
		bf = display.newCircle(254, 35, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(254, 35, 25)
        bd:setFillColor(0, 0, 0)
	end
end

function tabuleiro:desenhar21(simbolo)
	self[2][1] = simbolo

    if simbolo == "X" then
        x = display.newLine(10, 80, 90, 140)
        y = display.newLine(90, 80, 10, 140)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(50, 110, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(50, 110, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar22(simbolo)
	self[2][2] = simbolo

    if simbolo == "X" then
        x = display.newLine(110, 80, 190, 140)
        y = display.newLine(190, 80, 110, 140)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(152, 110, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(152, 110, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar23(simbolo)
	self[2][3] = simbolo

    if simbolo == "X" then
        x = display.newLine(210, 80, 290, 140)
        y = display.newLine(290, 80, 210, 140)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(254, 110, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(254, 110, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar31(simbolo)
	self[3][1] = simbolo

    if simbolo == "X" then
        x = display.newLine(10, 160, 90, 215)
        y = display.newLine(90, 160, 10, 215)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(50, 190, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(50, 190, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar32(simbolo)
	self[3][2] = simbolo

    if simbolo == "X" then
        x = display.newLine(110, 160, 190, 215)
        y = display.newLine(190, 160, 110, 215)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(152, 190, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(152, 190, 25)
        bd:setFillColor(0, 0, 0)
    end
end

function tabuleiro:desenhar33(simbolo)
	self[3][3] = simbolo

    if simbolo == "X" then
        x = display.newLine(210, 160, 290, 215)
        y = display.newLine(290, 160, 210, 215)

        x.strokeWidth = 5
        y.strokeWidth = 5

        x:setStrokeColor(1, 1, 1)
        y:setStrokeColor(1, 1, 1)
	else
		bf = display.newCircle(254, 190, 30)
        bf:setFillColor(1, 1, 1)

        bd = display.newCircle(254, 190, 25)
        bd:setFillColor(0, 0, 0)
    end
end

--Retorna o valor do tabuleiro
return tabuleiro
