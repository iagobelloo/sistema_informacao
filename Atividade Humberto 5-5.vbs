dim voz, nome, lista_palavras, lista_fonetica, acertos, pulos, ordem, resposta, reiniciar
set voz = CreateObject("SAPI.SpVoice")
nome = inputbox("Digite seu nome:")
voz.Speak "Olá, " & nome & "! Seja bem-vindo. Vamos começar o jogo! Escolha a ordem '1' para ascendente ou '2' para descendente para ouvir os personagens da Marvel e escrever o nome. Você tem direito a um pulo, mas cuidado, se errar, o jogo acaba! Boa sorte!", 1

lista_palavras = Array("Homem de Ferro", "Capitão América", "Thor", "Hulk", "Viúva Negra", "Homem Aranha", "Pantera Negra", "Doutor Estranho", "Capitã Marvel", "Homem Formiga", "Groot", "Senhor das Estrelas", "Wolverine", "Deadpool", "Feiticeira Escarlate", "Visão", "Falcão", "Gavião Arqueiro", "Loki", "Soldado Invernal")
lista_fonetica = Array("Homem de Ferro", "Capitão América", "Tór", "Rulque", "Viúva Negra", "Homem Aranha", "Pantera Negra", "Doutor Estranho", "Capitã Marvel", "Homem Formiga", "Gruti", "Senhor das Estrelas", "Uolverine", "Dédipul", "Feiticeira Escarlate", "Visão", "Falcão", "Gavião Arqueiro", "Lóqui", "Soldado Invernal")

Do
    acertos = 0
    pulos = 1
    perdeu = False
    ordem = inputbox("Olá, " & nome & "! Seja bem-vindo. Vamos começar o jogo! Escolha a ordem '1' para ascendente ou '2' para descendente para ouvir os personagens da Marvel e escrever o nome. Você tem direito a um pulo, mas cuidado, se errar, o jogo acaba! Boa sorte!")
    if ordem <> "1" and ordem <> "2" then
        voz.Speak "Ordem inválida. Usando ordem ascendente."
        ordem = "1"
    end if

    if ordem = "1" then
        i = 0
        continuar = True
        Do While continuar
            voz.Speak lista_fonetica(i), 1
            resposta = inputbox("Qual é o personagem da Marvel que acabou de ouvir? Caso não se lembre digite '1' para ouvir novamente e '2' para pular:")
            
            if LimparTexto(resposta) = LimparTexto(lista_palavras(i)) then
                voz.Speak "Parabéns! Você acertou!"
                acertos = acertos + 1
                i = i + 1
            elseif resposta = "1" then
                voz.Speak "Repetindo o personagem..."
            elseif resposta = "2" then
                if pulos > 0 then
                    voz.Speak "Pulando para o próximo personagem..."
                    pulos = pulos - 1
                    i = i + 1
                else
                    voz.Speak "Você já usou seu único pulo. Tente responder!"
                end if
            else
                voz.Speak "Ops! A resposta correta era " & lista_palavras(i) & ". Você errou. Fim de jogo!"
                continuar = False
                perdeu = True
            end if

            If continuar And i > UBound(lista_palavras) Then
                continuar = False
            End If
        Loop
    else
        i = UBound(lista_palavras)
        continuar = True
        Do While continuar
            voz.Speak lista_fonetica(i), 1
            resposta = inputbox("Qual é o personagem da Marvel que acabou de ouvir? Caso não se lembre digite '1' para ouvir novamente e '2' para pular:")
            
            if LimparTexto(resposta) = LimparTexto(lista_palavras(i)) then
                voz.Speak "Parabéns! Você acertou!"
                acertos = acertos + 1
                i = i - 1
            elseif resposta = "1" then
                voz.Speak "Repetindo o personagem..."
            elseif resposta = "2" then
                if pulos > 0 then
                    voz.Speak "Pulando para o próximo personagem..."
                    pulos = pulos - 1
                    i = i - 1
                else
                    voz.Speak "Você já usou seu único pulo. Tente responder!"
                end if
            else
                voz.Speak "Ops! A resposta correta era " & lista_palavras(i) & ". Você errou. Fim de jogo!"
                continuar = False
                perdeu = True
            end if

            If continuar And i < 0 Then
                continuar = False
            End If
        Loop
    end if
if perdeu = False then
        voz.Speak "Você foi campeão, parabéns, " & nome & "! Você acertou " & acertos & " personagens da Marvel. Deseja jogar novamente?", 1
        reiniciar = msgbox("CAMPEÃO!" & vbNewLine & vbNewLine & "Você gabaritou a lista e acertou " & acertos & " personagens!" & vbNewLine & "Deseja jogar novamente?", vbQuestion + vbYesNo, "Vitória")
    else
        voz.Speak "Você errou e por isso o jogo acabou, " & nome & ". Mas você acertou " & acertos & " personagens da Marvel. Deseja jogar novamente?", 1
        reiniciar = msgbox("FIM DE JOGO" & vbNewLine & vbNewLine & "Você foi eliminado, mas acertou " & acertos & " personagens." & vbNewLine & "Deseja jogar novamente?", vbQuestion + vbYesNo, "Derrota")
    end if
Loop While reiniciar = vbYes

voz.Speak "Obrigado por jogar! Até a próxima, " & nome & "!"

' Ignora acentos na hora de validar a resposta
Function LimparTexto(texto)
    Dim txt, j, com_acento, sem_acento
    txt = LCase(texto)
    
    com_acento = "áàãâéêíóõôúç"
    sem_acento = "aaaaeeiooouc"
    
    For j = 1 To Len(com_acento)
        txt = Replace(txt, Mid(com_acento, j, 1), Mid(sem_acento, j, 1))
    Next
    
    LimparTexto = txt
End Function