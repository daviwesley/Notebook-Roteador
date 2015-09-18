@echo off
title Notebook Roteador by Davi Wesley
color 0a
:menu
 echo                    .-------------------------------------------.
 echo                    .                MENU                       .
 echo                    . 1. Criar e Executar roteador              .
 echo                    . 2. Parar roteador                         .
 echo                    . 3. Ajuda(Instrucoes)                      .
 echo                    . 4. Ver senhas de Wifi                     .
 echo                    . 5. Sair ou aperte (Ctrl+c)                .
 echo                    .-------------------------------------------.
 echo                    by Davi Wesley e-mail: davi.wesley@icloud.com
 echo.
set /p opcao=Digite o numero da opcao:
 if %opcao% ==1 goto criar
 if %opcao% ==2 goto parar
 if %opcao% ==3 goto ajuda
 if %opcao% ==4 goto wifi
 if %opcao% ==5 goto sair

:criar
 set /p nome=Digite o nome da rede(sem espacos):
 set /p senha=Digite a senha(minimo 8 caracteres)
 netsh wlan set hostednetwork mode=allow ssid=%nome% key=%senha% KeyUsage=persistent
 netsh wlan start hostednetwork
 pause
 cls
 goto menu

:parar
 cls
 netsh wlan stop hostednetwork
 pause
 cls
 goto menu

:ajuda
 cls
 echo Para que o script bat funcione corretamente vc precisara
 echo executar como administrador, faca isso clicando com o botao direito sobre
 echo o arquivo bat e escolhendo executar com o administrador, depois
 echo siga as intruncoes abaixo.
 echo.
 echo --------------INSTRUCOES IMPORTANTES----------------.
 echo  1.Aperte windows+r                                 .
 echo  2.Digite ncpa.cpl e tecle enter                    .
 echo  3.Procure seu adaptador de rede(Ethernet)          .
 echo  4.Clique com o botao direito e dps em propiedades  .
 echo  5.Va na aba compartilhamento                       .
 echo  6.Marque a opcaoo: permitir que outros usuarios... .
 echo  7.Em conexao de rede domestica escolhar uma com o  .
 echo  nome conexao local                                 .
 echo  8.Clique no botao  OK                              .
 echo  9.Se vc ja fez esses passos nao precisa fazer nova .
 echo  mente                                              .
 echo ----------------------------------------------------.
 pause
 cls
 goto menu
 
:wifi
 cls
 netsh wlan show profile key=clear
 set /p varnome=Digite o nome da rede para revelar a senha
 netsh wlan show profile name=%varnome% key=clear
 pause
 cls
 goto menu
 
:sair
 echo Tchauuuuuuuuuuuuuu!!!
 exit

