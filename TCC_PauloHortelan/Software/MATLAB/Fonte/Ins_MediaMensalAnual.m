% Variaveis obtidas -> ins_media_mes, insmax_media_mes,
% insDiv_mediaMensalAnual

format long g

% Trad é a tabela com header MEDIA_INSO que contém média da radiaçao de cada mes
% medida no dia
strins1 = 'U11:U';
strins2 = num2str(linhas_media);
Tins = readtable(nome_arquivo,'Range',strcat(strins1,strins2));

ins_media_mes = zeros(12,1); % (1) = janeiro, (2) = fevereiro, etc
insmax_media_mes = zeros(12,1);
insDiv_mediaMensalAnual = zeros(12,1);
contador = zeros(12,1);
contador_extra = zeros(12,1);
j = 0; 
for i=1:linhas_media-11
    if  i == j + 1 % janeiro
        if insolacao_max(i,1) ~= 0
            contador(1,1) = contador(1,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(1,1) = contador_extra(1,1) + 1;
        end             
        ins_media_mes(1,1) = ins_media_mes(1,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(1,1) = insmax_media_mes(1,1) + insolacao_max(i,1);
    elseif i == j + 2
        if insolacao_max(i,1) ~= 0
            contador(2,1) = contador(2,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(2,1) = contador_extra(2,1) + 1;
        end             
        ins_media_mes(2,1) = ins_media_mes(2,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(2,1) = insmax_media_mes(2,1) + insolacao_max(i,1);
    elseif i == j + 3
        if insolacao_max(i,1) ~= 0
            contador(3,1) = contador(3,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(3,1) = contador_extra(3,1) + 1;
        end             
        ins_media_mes(3,1) = ins_media_mes(3,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(3,1) = insmax_media_mes(3,1) + insolacao_max(i,1);
    elseif i == j + 4
        if insolacao_max(i,1) ~= 0
            contador(4,1) = contador(4,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(4,1) = contador_extra(4,1) + 1;
        end             
        ins_media_mes(4,1) = ins_media_mes(4,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(4,1) = insmax_media_mes(4,1) + insolacao_max(i,1);
    elseif i == j + 5
        if insolacao_max(i,1) ~= 0
            contador(5,1) = contador(5,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(5,1) = contador_extra(5,1) + 1;
        end             
        ins_media_mes(5,1) = ins_media_mes(5,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(5,1) = insmax_media_mes(5,1) + insolacao_max(i,1);
    elseif i == j + 6
        if insolacao_max(i,1) ~= 0
            contador(6,1) = contador(6,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(6,1) = contador_extra(6,1) + 1;
        end             
        ins_media_mes(6,1) = ins_media_mes(6,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(6,1) = insmax_media_mes(6,1) + insolacao_max(i,1);
    elseif i == j + 7
        if insolacao_max(i,1) ~= 0
            contador(7,1) = contador(7,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(7,1) = contador_extra(7,1) + 1;
        end             
        ins_media_mes(7,1) = ins_media_mes(7,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(7,1) = insmax_media_mes(7,1) + insolacao_max(i,1);
    elseif i == j + 8
        if insolacao_max(i,1) ~= 0
            contador(8,1) = contador(8,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(8,1) = contador_extra(8,1) + 1;
        end             
        ins_media_mes(8,1) = ins_media_mes(8,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(8,1) = insmax_media_mes(8,1) + insolacao_max(i,1);
    elseif i == j + 9
        if insolacao_max(i,1) ~= 0
            contador(9,1) = contador(9,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(9,1) = contador_extra(9,1) + 1;
        end             
        ins_media_mes(9,1) = ins_media_mes(9,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(9,1) = insmax_media_mes(9,1) + insolacao_max(i,1);
    elseif i == j + 10
        if insolacao_max(i,1) ~= 0
            contador(10,1) = contador(10,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(10,1) = contador_extra(10,1) + 1;
        end             
        ins_media_mes(10,1) = ins_media_mes(10,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(10,1) = insmax_media_mes(10,1) + insolacao_max(i,1);
    elseif i == j + 11
        if insolacao_max(i,1) ~= 0
            contador(11,1) = contador(11,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(11,1) = contador_extra(11,1) + 1;
        end             
        ins_media_mes(11,1) = ins_media_mes(11,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(11,1) = insmax_media_mes(11,1) + insolacao_max(i,1);
    elseif i == j + 12
        if insolacao_max(i,1) ~= 0
            contador(12,1) = contador(12,1) + 1;
        end
        if Tins.MEDIA_INS(i,1) ~= 0
            contador_extra(12,1) = contador_extra(12,1) + 1;
        end             
        ins_media_mes(12,1) = ins_media_mes(12,1) + Tins.MEDIA_INS(i,1);
        insmax_media_mes(12,1) = insmax_media_mes(12,1) + insolacao_max(i,1);
        j = j + 12;
    end   

end

ins_media_mes = ins_media_mes./contador;
insmax_media_mes = insmax_media_mes./contador_extra;
insDiv_mediaMensalAnual = ins_media_mes./insmax_media_mes; % n/N