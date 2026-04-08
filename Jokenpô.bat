@echo off
::Joquempô - Jogo Jo-Ken-Po com Lagarto e Spock
mode con: cols=80 lines=25
color 0A
::Variaveis
set vit=0
set derrota=0
set emp=0

cls
echo.
set /p nome=Digite seu nome: 

:inicio
cls
echo =============================================
echo =========          (o  o)           =========
echo =========     ---ooo(oo)ooo---      =========
echo =========  Bem Vindo ao JO-KEN-PO   =========
echo =============================================
echo.
echo [1] PEDRA
echo [2] PAPEL
echo [3] TESOURA
echo [4] LAGARTO
echo [5] SPOCK
echo [R] REGRAS
echo [E] ENCERRAR JOGO
echo -----------------------------------------------
echo.
set "opt="  :: limpa valor anterior antes de ler
set /p opt=Escolha uma opcao:
:: remover espaços acidentais
set "opt=%opt: =%"
:: tratar letras especiais antes de converter pra número
if /i "%opt%" == "E" exit
if /i "%opt%" == "R" goto regras
:: tentar converter o resto em inteiro, voltar se falhar
set /a opt=%opt% 2>nul || goto inicio  :: valor não numérico volta ao menu
:: agora opt é um número simples, comparações funcionam corretamente
if %opt% LSS 1 goto inicio
if %opt% GTR 5 goto inicio

set /a comp=(%random% %%5) + 1

:: simbolos do jogador  
if %opt%==1 set player_txt=PEDRA
if %opt%==2 set player_txt=PAPEL
if %opt%==3 set player_txt=TESOURA
if %opt%==4 set player_txt=LAGARTO
if %opt%==5 set player_txt=SPOCK

:: simbolos do computador
if %comp%==1 set comp_txt=PEDRA
if %comp%==2 set comp_txt=PAPEL
if %comp%==3 set comp_txt=TESOURA
if %comp%==4 set comp_txt=LAGARTO
if %comp%==5 set comp_txt=SPOCK

echo.
echo %nome% escolheu: %player_txt%!
echo Computador escolheu: %comp_txt%!
echo.
::Regras (cada combinação testa vitória do jogador) primeiro, empate
if %opt%==%comp% (
    echo EMPATE !!!
    set /a emp+=1
    goto fim_regras
)

:: vitórias do jogador (opção, computador)
if %opt%==1 if %comp%==3 goto player_vence
if %opt%==1 if %comp%==4 goto player_vence
if %opt%==2 if %comp%==1 goto player_vence
if %opt%==2 if %comp%==5 goto player_vence
if %opt%==3 if %comp%==2 goto player_vence
if %opt%==3 if %comp%==4 goto player_vence
if %opt%==4 if %comp%==2 goto player_vence
if %opt%==4 if %comp%==5 goto player_vence
if %opt%==5 if %comp%==1 goto player_vence
if %opt%==5 if %comp%==3 goto player_vence

:: nenhum dos casos anteriores se aplicou -> computador vence
:computador_vence
    echo COMPUTADOR VENCEU !!!
    echo %nome% PERDEU !!!
    set /a derrota+=1
    goto fim_regras

:player_vence
    echo %nome% VENCEU !!!
    set /a vit+=1
    goto fim_regras

:fim_regras

echo.
echo == PLACAR ATUALIZADO ==
echo VITORIAS: %vit%   DERROTAS: %derrota%   EMPATES: %emp%
echo.
pause
set /p resp=Deseja jogar novamente? [S/N]:
if /i "%resp%" == "S" (goto:inicio) else (exit)
:regras
cls
echo.
echo =============================================
echo =========       REGRAS DO JOGO     ==========
echo.
echo 1. PEDRA esmaga TESOURA e LAGARTO
echo 2. PAPEL cobre PEDRA e refuta SPOCK
echo 3. TESOURA corta PAPEL e decapita LAGARTO
echo 4. LAGARTO come PAPEL e envenena SPOCK
echo 5. SPOCK vaporiza PEDRA e esmaga TESOURA
pause
goto:inicio