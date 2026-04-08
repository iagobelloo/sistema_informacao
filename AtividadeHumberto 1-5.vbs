dim inteiro, sucessor, antecessor, resp
call chamar_entrada
function chamar_entrada()
    inteiro = cint(inputbox("Digite um número inteiro:"))
    sucessor = inteiro + 1
    antecessor = inteiro - 1
    msgbox ("O sucessor de " & inteiro & " é " & sucessor & "" + vbnewline &_
            "O antecessor de " & inteiro & " é " & antecessor & ""), vbinformation + vbokonly, "Sucessor e Antecessor"
    resp = msgbox("Deseja calcular novamente?", vbquestion + vbyesno, "AVISO")
    if resp = vbyes then
        call chamar_entrada
    else
        wscript.quit
    end if
end function