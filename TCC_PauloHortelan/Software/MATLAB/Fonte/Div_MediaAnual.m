% Cria a média dos anos, ou seja, um vetor de X lugares (1 para cada
% ano) que contém a média dos 12 meses)

% Variaveis obtidas -> radDiv_mediaAnual, insDiv_mediaAnual

format long g

rad_media_ano = zeros(18,1); % (1) = primeiro ano, (2) = segundo ano, etc
radextra_media_ano = zeros(18,1);
ins_media_ano = zeros(18,1);
insmax_media_ano = zeros(18,1);
radDiv_mediaAnual = zeros(18,1);
insDiv_mediaAnual = zeros(18,1);

contador_2 = zeros(18,1);
contador_extra_2 = zeros(18,1);
contador_3 = zeros(18,1);
contador_extra_3 = zeros(18,1);
j = 1;
p = 1;
for i=1:linhas_media-11
    if j == 13 % se j=13, ja passou um ano
        j = 1;
        p = p + 1; % p é a contagem dos anos
    end
    
    %Verifico a radiacao
    if Trad.MEDIA_RAD(i,1) ~= 0 && ~isnan(Trad.MEDIA_RAD(i,1)) % Se for diferente de 0 e diferente de NaN, eu conto
        contador_2(p,1) = contador_2(p,1) + 1;            
        rad_media_ano(p,1) = rad_media_ano(p,1) + Trad.MEDIA_RAD(i,1);
    end
    if rad_extra_media(i,1) ~= 0 && ~isnan(Trad.MEDIA_RAD(i,1))
        contador_extra_2(p,1) = contador_extra_2(p,1) + 1;
        radextra_media_ano(p,1) = radextra_media_ano(p,1) + rad_extra_media(i,1);  
    end
    
    % Verifico a insolaçao
    if Tins.MEDIA_INS(i,1) ~= 0 && ~isnan(Tins.MEDIA_INS(i,1)) % Se for diferente de 0 e diferente de NaN, eu conto
        contador_3(p,1) = contador_3(p,1) + 1;            
        ins_media_ano(p,1) = ins_media_ano(p,1) + Tins.MEDIA_INS(i,1);
    end
    if ins_max_media(i,1) ~= 0 && ~isnan(Tins.MEDIA_INS(i,1))
        contador_extra_3(p,1) = contador_extra_3(p,1) + 1;
        insmax_media_ano(p,1) = insmax_media_ano(p,1) + ins_max_media(i,1);  
    end
    
    j = j + 1;
end

rad_media_ano = rad_media_ano./contador_2;
radextra_media_ano = radextra_media_ano./contador_extra_2;
ins_media_ano = ins_media_ano./contador_3;
insmax_media_ano = insmax_media_ano./contador_extra_3;

radDiv_mediaAnual = rad_media_ano./radextra_media_ano;
insDiv_mediaAnual = ins_media_ano./insmax_media_ano;

% Deleto as linhas que possuirem 0 ou NaN
rowsToDelete = radDiv_mediaAnual == 0 | isnan(radDiv_mediaAnual);
radDiv_mediaAnual(rowsToDelete) = [];
insDiv_mediaAnual(rowsToDelete) = [];

rowsToDelete = insDiv_mediaAnual == 0 | isnan(insDiv_mediaAnual);
radDiv_mediaAnual(rowsToDelete) = [];
insDiv_mediaAnual(rowsToDelete) = [];
