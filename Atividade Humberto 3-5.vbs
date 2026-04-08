dim n1, n2, n3, maior, menor
n1 = CInt(inputBox("Digite o primeiro número:"))
n2 = CInt(inputBox("Digite o segundo número:"))
n3 = CInt(inputBox("Digite o terceiro número:"))
if n1 > n2 And n1 > n3 Then
    maior = n1
ElseIf n2 > n1 And n2 > n3 Then
    maior = n2
Else
    maior = n3
End If 
if n1 < n2 And n1 < n3 Then
    menor = n1 
ElseIf n2 < n1 And n2 < n3 Then
    menor = n2
Else
    menor = n3
End If
MsgBox "O maior número é: " & maior & vbNewLine & "O menor número é: " & menor, vbInformation + vbOKOnly, "Resultados"
