dim quantidade_salario, salario_bruto, salario_liquido, inss
salario_minimo = cdbl(1621.00)
quantidade_salario = cdbl(inputbox("Digite o número de salários mínimos que você recebe:"))
salario_bruto = quantidade_salario * salario_minimo
if salario_bruto <= salario_minimo Then
    inss = salario_bruto * 0.075
ElseIf salario_bruto > salario_minimo And salario_bruto <= 2902.84 Then
    inss = salario_bruto * 0.09
ElseIf salario_bruto > 2902.84 And salario_bruto <= 4354.27 Then
    inss = salario_bruto * 0.12
Else
    inss = salario_bruto * 0.14
End If
salario_liquido = salario_bruto - inss
MsgBox "O valor do salário bruto é: R$ " & FormatNumber(salario_bruto, 2) & vbNewLine & "O valor do INSS é: R$ " & FormatNumber(inss, 2) & vbNewLine & "O valor do salário líquido é: R$ " & FormatNumber(salario_liquido, 2), vbInformation + vbOKOnly, "Resultados"
