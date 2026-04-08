dim lado, perimetro, area, resp
call chamar_entrada
function chamar_entrada()
    lado = cdbl(inputbox("Digite o valor do lado do quadrado:"))
    perimetro = 4 * lado
    area = lado ^ 2
   msgbox "O perímetro do quadrado é: " & perimetro & vbnewline & "A área do quadrado é: " & area, vbinformation + vbokonly, "Resultados"
    resp = msgbox("Deseja calcular o perímetro de outro quadrado?", vbquestion + vbyesno, "Calcular novamente")
    if resp = vbyes then
        call chamar_entrada
    else
        msgbox ("Obrigado por usar o programa!"), vbinformation + vbokonly, "Encerrando"
    end if 
end function
