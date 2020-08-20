% Hemisfério Sul
% Primavera: 1 setembro até 30 novembro
% Verão: 1 dezembro até 28 fevereiro
% Outono: 1 março até 31 maio
% Inverno: 1 junho até 31 agosto

% divisao entre H/Ho e n/N nas estacoes do ano
radDiv_Primavera = zeros(18,1);
insDiv_Primavera = zeros(18,1);
radDiv_Verao = zeros(18,1);
insDiv_Verao = zeros(18,1);
radDiv_Outono = zeros(18,1);
insDiv_Outono = zeros(18,1);
radDiv_Inverno = zeros(18,1);
insDiv_Inverno = zeros(18,1);

% Guarda a radiação normal e a radiação extra
rad_Primavera = zeros(18,1);
rad_Verao = zeros(18,1);
rad_Outono = zeros(18,1);
rad_Inverno = zeros(18,1);
radExtra_Primavera = zeros(18,1);
radExtra_Verao = zeros(18,1);
radExtra_Outono = zeros(18,1);
radExtra_Inverno = zeros(18,1);

% Faço a divisao H/Ho e n/N
rad_mes_geral2 = Trad.MEDIA_RAD./rad_extra_media;
ins_mes_geral2 = Tins.MEDIA_INS./ins_max_media;

j = 1;
p = 1;
for i=1:linhas_media-11
    if j == 13 % se j=13, ja passou um ano
        j = 1;
        p = p + 1; % p é a contagem dos anos
    end
    
    if j >= 9 && j <= 11 % se tiver entre setembro e novembro é PRIMAVERA
        radDiv_Primavera(p,1) = rad_mes_geral2(i,1);
        insDiv_Primavera(p,1) = ins_mes_geral2(i,1);
        radExtra_Primavera(p,1) = rad_extra_media(i,1);
        rad_Primavera(p,1) = Trad.MEDIA_RAD(i,1);
    end
    if j == 12 || j <= 2 % se tiver entre dezembro e fevereiro é VERÃO
        radDiv_Verao(p,1) = rad_mes_geral2(i,1);
        insDiv_Verao(p,1) = ins_mes_geral2(i,1); 
        radExtra_Verao(p,1) = rad_extra_media(i,1);
        rad_Verao(p,1) = Trad.MEDIA_RAD(i,1);
    end
    if j >= 3 && j <= 5 % se tiver entre março e maio é OUTONO
        radDiv_Outono(p,1) = rad_mes_geral2(i,1);
        insDiv_Outono(p,1) = ins_mes_geral2(i,1);   
        radExtra_Outono(p,1) = rad_extra_media(i,1);
        rad_Outono(p,1) = Trad.MEDIA_RAD(i,1);
    end    
    if j >= 6 && j <= 8 % se tiver entre junho e agosto é INVERNO
        radDiv_Inverno(p,1) = rad_mes_geral2(i,1);
        insDiv_Inverno(p,1) = ins_mes_geral2(i,1);  
        radExtra_Inverno(p,1) = rad_extra_media(i,1);
        rad_Inverno(p,1) = Trad.MEDIA_RAD(i,1);
    end            
    
    j = j + 1;
end

% Deleto as linhas que possuirem 0 ou NaN
rowsToDelete = radDiv_Primavera == 0 | isnan(radDiv_Primavera);
radDiv_Primavera(rowsToDelete) = [];
insDiv_Primavera(rowsToDelete) = [];
radExtra_Primavera(rowsToDelete) = [];
rad_Primavera(rowsToDelete) = [];


rowsToDelete = radDiv_Verao == 0 | isnan(radDiv_Verao);
radDiv_Verao(rowsToDelete) = [];
insDiv_Verao(rowsToDelete) = [];
radExtra_Verao(rowsToDelete) = [];
rad_Verao(rowsToDelete) = [];

rowsToDelete = radDiv_Outono == 0 | isnan(radDiv_Outono);
radDiv_Outono(rowsToDelete) = [];
insDiv_Outono(rowsToDelete) = [];
radExtra_Outono(rowsToDelete) = [];
rad_Outono(rowsToDelete) = [];

rowsToDelete = radDiv_Inverno == 0 | isnan(radDiv_Inverno);
radDiv_Inverno(rowsToDelete) = [];
insDiv_Inverno(rowsToDelete) = [];
radExtra_Inverno(rowsToDelete) = [];
rad_Inverno(rowsToDelete) = [];