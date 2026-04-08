dim n1, n2, media, situacao, resp
dim audio   

call carregar_voz
function carregar_voz()
    set audio = CreateObject("SAPI.SpVoice")
        audio.volume = 100
        audio.rate = 2 'velocidade da voz
    call entrada_notas
end function

'chamada de função para entrada de notas
function entrada_notas()
    'possiveis entrada de dados
    'cint = conversçao de string para inteiro
    'cdbl = conversçao de string para decimal
    'ccur = conversçao de string para moeda
    'cdate = conversçao de string para data
    'cstr = conversçao de string para string
    n1 = cdbl(inputbox("Digite a primeira nota:"))
    n2 = cdbl(inputbox("Digite a segunda nota:"))
    'processamento de dados
    media = round((n1 + n2) / 2, 2)
    if (media <4) then
        situacao = "Reprovado"
    elseif (media >=4 and media < 6) then
        situacao = "Recuperação"
    else
        situacao = "Aprovado"
    end if

    'saida de dados por voz
    audio.speak ("A média do aluno é " & media & "" + vbnewline &_
                "Situação do aluno é " & situacao & "")
    'saida de dados por caixa de mensagem
    resp = msgbox("A média do aluno é " & media & "" + vbnewline &_
                "Situação do aluno é " & situacao & "" + vbnewline &_
                "Deseja calcular novamente?", vbquestion + vbyesno, "Rendimento do Aluno")
    if resp = vbyes then
        call entrada_notas
    else
        wscript.quit
    end if
end function