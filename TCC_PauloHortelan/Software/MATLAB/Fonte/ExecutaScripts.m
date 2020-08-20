% Esse script apenas roda os outros em uma sequencia

% A sequencia dos scripts a serem executados é:
% -> Principal.m
% -> Rad_MediaMensalAnual.m  - H/Ho média mensal anual
% -> Ins_MediaMensalAnual.m  - n/N média mensal anual
% -> Div_Diaria.m          - H/Ho e n/N diario
% -> Div_MediaMensal.m       - H/Ho e n/N média mensal
% -> Div_MediaAnual.m        - H/Ho e n/N média anual
% -> Div_Estacoes.m          - H/Ho e n/N quatro estações

Principal;
Rad_MediaMensalAnual;
Ins_MediaMensalAnual;
Div_Diaria;
Div_MediaMensal;
Div_MediaAnual;
Div_Estacoes;

% Depois, executa os scripts a seguir, que plotam graficos
% e geram arquivos .txt

Plot_Regressao;
Calculo_Estimada;
Plot_Estimada;
Estimada_Analise;

% Tdata = dados totais
% Tins_aux = dados usados