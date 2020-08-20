% Paulo Hortelan Ribeiro, Unesp-Bauru

% O programa a seguir tem por objetivo simular a equação de estimação da 
% radiação solar de Angstrom-Prescott

% A sequencia dos scripts a serem executados (e o que cada um faz, resumidamente) é:
% -> Principal.m             - Seta constantes, lê as tabelas e calcula Ho e N
% -> Rad_MediaMensalAnual.m  - H/Ho média mensal anual
% -> Ins_MediaMensalAnual.m  - n/N média mensal anual
% -> Div_Diaria.m            - H/Ho e n/N diario
% -> Div_MediaMensal.m       - H/Ho e n/N média mensal
% -> Div_MediaAnual.m        - H/Ho e n/N média anual
% -> Div_Estacoes.m          - H/Ho e n/N quatro estações
% -> Plot_Regressao.m        - Plota graficos da regressão linear, calcula a e b, e seus respectivos R2;
%                            - Gera um .txt com os valores de a, b e R2                                      
% -> Calculo_Estimada.m      - Calcula a radiação solar (H) estimada
% -> Plot_Estimada.m         - Plota gráficos da comparação entre H observada e H estimada
% -> Estimada_Analise.m      - Realiza analises estatisticas e gera um arquivo .txt com os resultados

clear variables

Isc =   1367; %constante solar
linhas = 4029; %quantidade de linhas da tabela (na coluna RADIACAO ou INSOLACAO)
linhas_media = 143; %quantidade de linhas da tabela (na coluna MEDIA_RAD ou MEDIA_INS)
nome_arquivo = 'C:\Users\pauli\Documents\TCC_Matlab\Tabelas\Aragarcas_Aw\Aragarcas_1.xls';
nome_cidade = 'Aragarcas';

extra = zeros(1,1);
rad_extra = zeros(1,1); %radiaçao extraterrestre calculada diariamente
rad_extra_media = zeros(1,1); %radiaçao extraterrestre mensal media
ins_max_media = zeros(1,1);
insolacao_max = zeros(1,1);
insolacao_max_mes = zeros(1,1);
rad_divisao = zeros(linhas_media,1);

format long g

% Tdata é a tabela com header DATA, que contém a data formatada
str1 = 'Q11:Q';
str2 = num2str(linhas);
strcat(str1,str2);
Tdata = readtable(nome_arquivo,'Range',strcat(str1,str2));
Tdata.DATA.Format = 'dd-MM-yyyy';

% Tlati é a tabela com header LAT, que contém a latitude
Tlati = readtable(nome_arquivo,'Range','P11:P13');
fi = f_convertelati(Tlati.LAT(1),Tlati.LAT(2),'S');

% Calcula a radiaçao extraterrestre diaria, calculada em MJ e joga na
% variavel 'rad_extra'. Ou seja, 'Ho' diario
for i= 12:linhas
    if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-01-')
        mes = '-01-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-02-')
        mes = '-02-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-03-')
        mes = '-03-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-04-')
        mes = '-04-';    
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-05-')
        mes = '-05-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-06-')
        mes = '-06-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-07-')
        mes = '-07-';   
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-08-')
        mes = '-08-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-09-')
        mes = '-09-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-10-')
        mes = '-10-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-11-')
        mes = '-11-';   
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-12-')
        mes = '-12-';          
    end
    
    token = strtok(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-');
    extra(i,1) = str2double(token);
    delta = f_angdecl(extra(i,1),mes);
    omega = f_horaangsol(fi,delta);
    p1 = 24*Isc*3600/pi;
    p2 = (1+0.033*cosd(360*extra(i,1)/365));
    p3 = (cosd(fi)*cosd(delta)*sind(omega)+((pi*omega*sind(fi)*sind(delta))/180));
    
    %O valor obtido da radiaçao extraterrestre é em MJ/m^2/dia
    rad_extra(i,1) = p1*p2*p3/1000000;
end

% Esse 'for' faz a contagem da radiaçao extraterrestre calculada e gera a
% media mensal, salvando ela em rad_extra_media. Ou seja, 'Ho' mensal
lin = 1;
jan= 0; fev = 0; fev_dias = 0; mar = 0; abr = 0; mai = 0; jun = 0; jul = 0; ago = 0;
setem = 0; out = 0; nov = 0; dez = 0;
for i=12:linhas
    if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-01-')
        mes = '-01-';
        jan = jan + rad_extra(i,1);
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-02-')
        mes = '-02-';
        fev_dias = fev_dias + 1;
        fev = fev + rad_extra(i,1);
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-03-')
        mes = '-03-';
        mar = mar + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-04-')
        mes = '-04-';    
        abr = abr + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-05-')
        mes = '-05-'; 
        mai = mai + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-06-')
        mes = '-06-'; 
        jun = jun + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-07-')
        mes = '-07-';  
        jul = jul + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-08-')
        mes = '-08-';  
        ago = ago + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-09-')
        mes = '-09-';  
        setem = setem + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-10-')
        mes = '-10-';  
        out = out + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-11-')
        mes = '-11-';   
        nov = nov + rad_extra(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-12-')
        mes = '-12-';  
        dez = dez + rad_extra(i,1);
        
        %No ultimo dia do ano eu calculo a media mensal do mesmo e jogo em
        %rad_extra_media
        if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'31-')
            rad_extra_media(lin,1) = jan/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = fev/fev_dias;
            lin = lin + 1;     
            rad_extra_media(lin,1) = mar/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = abr/30;
            lin = lin + 1;
            rad_extra_media(lin,1) = mai/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = jun/30;
            lin = lin + 1;       
            rad_extra_media(lin,1) = jul/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = ago/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = setem/30;
            lin = lin + 1;
            rad_extra_media(lin,1) = out/31;
            lin = lin + 1;
            rad_extra_media(lin,1) = nov/30;
            lin = lin + 1;
            rad_extra_media(lin,1) = dez/31;
            lin = lin + 1;            
            
            jan = 0;
            fev = 0;
            fev_dias = 0;
            mar = 0;
            abr = 0;
            mai = 0;
            jun = 0;
            jul = 0;
            ago = 0;
            setem = 0;
            out = 0;
            nov = 0;
            dez = 0;
        end
    end
end

% Calcula a insolação maxima, chamada de N. Salva na variavel
% 'insolacao_max'
for i= 12:linhas
    if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-01-')
        mes = '-01-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-02-')
        mes = '-02-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-03-')
        mes = '-03-';
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-04-')
        mes = '-04-';    
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-05-')
        mes = '-05-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-06-')
        mes = '-06-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-07-')
        mes = '-07-';   
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-08-')
        mes = '-08-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-09-')
        mes = '-09-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-10-')
        mes = '-10-';  
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-11-')
        mes = '-11-';   
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-12-')
        mes = '-12-';          
    end
    
    token = strtok(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-');
    extra(i,1) = str2double(token);
    delta = f_angdecl(extra(i,1),mes);
    omega = f_horaangsol(fi,delta);
    
    %insolacao maxima diaria, em horas
    insolacao_max(i,1) = 2*omega/15;
end

% Esse 'for' faz a contagem da insolacao max calculada e gera a
% media mensal, salvando ela em ins_max_media. Ou seja, 'N' mensal
lin = 1;
jan= 0; fev = 0; fev_dias = 0; mar = 0; abr = 0; mai = 0; jun = 0; jul = 0; ago = 0;
setem = 0; out = 0; nov = 0; dez = 0;
for i=12:linhas
    if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-01-')
        mes = '-01-';
        jan = jan + insolacao_max(i,1);
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-02-')
        mes = '-02-';
        fev_dias = fev_dias + 1;
        fev = fev + insolacao_max(i,1);
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-03-')
        mes = '-03-';
        mar = mar + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-04-')
        mes = '-04-';    
        abr = abr + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-05-')
        mes = '-05-'; 
        mai = mai + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-06-')
        mes = '-06-'; 
        jun = jun + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-07-')
        mes = '-07-';  
        jul = jul + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-08-')
        mes = '-08-';  
        ago = ago + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-09-')
        mes = '-09-';  
        setem = setem + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-10-')
        mes = '-10-';  
        out = out + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-11-')
        mes = '-11-';   
        nov = nov + insolacao_max(i,1);        
    elseif contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'-12-')
        mes = '-12-';  
        dez = dez + insolacao_max(i,1);
        
        %No ultimo dia do ano eu calculo a media mensal do mesmo e jogo em
        %rad_extra_media
        if contains(datestr(Tdata.DATA(i-11),'dd-mm-yyyy'),'31-')
            ins_max_media(lin,1) = jan/31;
            lin = lin + 1;
            ins_max_media(lin,1) = fev/fev_dias;
            lin = lin + 1;     
            ins_max_media(lin,1) = mar/31;
            lin = lin + 1;
            ins_max_media(lin,1) = abr/30;
            lin = lin + 1;
            ins_max_media(lin,1) = mai/31;
            lin = lin + 1;
            ins_max_media(lin,1) = jun/30;
            lin = lin + 1;       
            ins_max_media(lin,1) = jul/31;
            lin = lin + 1;
            ins_max_media(lin,1) = ago/31;
            lin = lin + 1;
            ins_max_media(lin,1) = setem/30;
            lin = lin + 1;
            ins_max_media(lin,1) = out/31;
            lin = lin + 1;
            ins_max_media(lin,1) = nov/30;
            lin = lin + 1;
            ins_max_media(lin,1) = dez/31;
            lin = lin + 1;            
            
            jan = 0;
            fev = 0;
            fev_dias = 0;
            mar = 0;
            abr = 0;
            mai = 0;
            jun = 0;
            jul = 0;
            ago = 0;
            setem = 0;
            out = 0;
            nov = 0;
            dez = 0;
        end
    end
end


