@echo off
setlocal enabledelayedexpansion
title Atividade adivinhe o numero
color 0a

:inicio
cls
:: Limpa a variável para garantir que o Enter não mantenha o valor anterior
set "nome="
set /p nome=Digite o nome do jogador: 
:: Trava: Se o nome estiver vazio, volta para o início
if "%nome%"=="" goto inicio

:novo_jogo
set /a numero=(%random% %% 50) + 1
set /a vidas=5
set /a cont=0

:jogo
cls
echo -------------------------------------------
echo      Adivinhar entre o Numero 1 e 50
echo -------------------------------------------
echo       Seja Bem-Vindo !!! %nome%
echo -------------------------------------------
echo Tentativas Restantes: %vidas%
echo -------------------------------------------
echo [P] Pontuacao do Jogadores  
echo [E] Sair                    
echo -------------------------------------------

if %vidas% leq 0 goto perder

:: Limpa a variável op antes de receber o palpite
set "op="
set /p op=Digite seu palpite: 

:: Trava: Se apertar apenas Enter (vazio), volta para o menu do jogo
if "%op%"=="" goto jogo

:: Atalhos de menu
if /i "%op%"=="p" goto consultar
if /i "%op%"=="e" exit

:: --- TRAVA DE VALIDAÇÃO (NÃO CONTA TENTATIVA) ---
if %op% LSS 1 (
    echo.
    echo ERRO: Digite apenas numeros entre 1 e 50!
    echo Sua tentativa NAO foi descontada.
    pause
    goto jogo
)
if %op% GTR 50 (
    echo.
    echo ERRO: Digite apenas numeros entre 1 e 50!
    echo Sua tentativa NAO foi descontada.
    pause
    goto jogo
)
:: ------------------------------------------------

set /a cont+=1
set /a vidas-=1

if %op% equ %numero% goto gravar
if %op% lss %numero% (echo. & echo Dica: O numero e MAIOR! & pause & goto jogo)
if %op% gtr %numero% (echo. & echo Dica: O numero e MENOR! & pause & goto jogo)

:gravar
cls
echo.
echo ===========================================
echo       PARABENS! VOCE ACERTOU!
echo ===========================================
echo O numero era: %numero%
echo Tentativas utilizadas: %cont%
echo.
echo %date%  %time:~0,8%      %cont%           %numero%       %nome% >> ListaJogadores.txt
pause
goto inicio

:perder
echo.
echo -------------------------------------------
echo VOCE PERDEU! O numero secreto era: %numero%
echo -------------------------------------------
pause
goto inicio

:consultar
cls
echo ------------------------------------------------------------
echo                LISTAGEM DE JOGADORES VENCEDORES
echo ------------------------------------------------------------
echo DATA         HORA       TENTATIVAS   NUMEROS   NOME
echo ------------------------------------------------------------
if exist ListaJogadores.txt (type ListaJogadores.txt) else (echo Nenhuma vitoria registrada.)
echo ------------------------------------------------------------
echo.
pause
goto jogo