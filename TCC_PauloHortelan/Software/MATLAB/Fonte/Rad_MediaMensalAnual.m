% Obtenho a MEDIA_RAD da tabela, e calculo a 'radDiv_mediaMensalAnual' que
% nada mais é que a média mensal (ou seja, somo todos os valores de cada mes, durante todos os anos
% e divido pela quantidade de meses) da divisão entre a radiação medida e a radiação
% extraterrestre 

% Variaveis obtidas -> rad_media_mes, radextra_media_mes,
% radDiv_mediaMensalAnual e Trad.MEDIA_RAD

format long g

% Trad é a tabela com header MEDIA_RAD que contém média da radiaçao de cada mes
% medida no dia
strrad1 = 'S11:S';
strrad2 = num2str(linhas_media);
Trad = readtable(nome_arquivo,'Range',strcat(strrad1,strrad2));

rad_media_mes = zeros(12,1); % (1) = janeiro, (2) = fevereiro, etc
radextra_media_mes = zeros(12,1);
radDiv_mediaMensalAnual = zeros(12,1);
contador = zeros(12,1);
contador_extra = zeros(12,1);
j = 0; 
% Trad.MEDIA_RAD pra MJ (divido por 1000)
for i=1:linhas_media-11
    Trad.MEDIA_RAD(i,1) = Trad.MEDIA_RAD(i,1)/1000;
    %rad_divisao(i,1) = Trad.MEDIA_RAD(i,1)/rad_extra_media(i,1);
end

% Cria a média dos meses, ou seja, um vetor de 12 lugares (1 para cada
% mes) que contém a média anual dos meses)
for i=1:linhas_media-11
    if  i == j + 1 % janeiro
        if rad_extra_media(i,1) ~= 0
            contador(1,1) = contador(1,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(1,1) = contador_extra(1,1) + 1;
        end             
        rad_media_mes(1,1) = rad_media_mes(1,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(1,1) = radextra_media_mes(1,1) + rad_extra_media(i,1);
    elseif i == j + 2
        if rad_extra_media(i,1) ~= 0
            contador(2,1) = contador(2,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(2,1) = contador_extra(2,1) + 1;
        end             
        rad_media_mes(2,1) = rad_media_mes(2,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(2,1) = radextra_media_mes(2,1) + rad_extra_media(i,1);
    elseif i == j + 3
        if rad_extra_media(i,1) ~= 0
            contador(3,1) = contador(3,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(3,1) = contador_extra(3,1) + 1;
        end             
        rad_media_mes(3,1) = rad_media_mes(3,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(3,1) = radextra_media_mes(3,1) + rad_extra_media(i,1);
    elseif i == j + 4
        if rad_extra_media(i,1) ~= 0
            contador(4,1) = contador(4,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(4,1) = contador_extra(4,1) + 1;
        end             
        rad_media_mes(4,1) = rad_media_mes(4,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(4,1) = radextra_media_mes(4,1) + rad_extra_media(i,1);
    elseif i == j + 5
        if rad_extra_media(i,1) ~= 0
            contador(5,1) = contador(5,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(5,1) = contador_extra(5,1) + 1;
        end             
        rad_media_mes(5,1) = rad_media_mes(5,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(5,1) = radextra_media_mes(5,1) + rad_extra_media(i,1);
    elseif i == j + 6
        if rad_extra_media(i,1) ~= 0
            contador(6,1) = contador(6,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(6,1) = contador_extra(6,1) + 1;
        end             
        rad_media_mes(6,1) = rad_media_mes(6,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(6,1) = radextra_media_mes(6,1) + rad_extra_media(i,1);
    elseif i == j + 7
        if rad_extra_media(i,1) ~= 0
            contador(7,1) = contador(7,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(7,1) = contador_extra(7,1) + 1;
        end             
        rad_media_mes(7,1) = rad_media_mes(7,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(7,1) = radextra_media_mes(7,1) + rad_extra_media(i,1);
    elseif i == j + 8
        if rad_extra_media(i,1) ~= 0
            contador(8,1) = contador(8,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(8,1) = contador_extra(8,1) + 1;
        end             
        rad_media_mes(8,1) = rad_media_mes(8,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(8,1) = radextra_media_mes(8,1) + rad_extra_media(i,1);
    elseif i == j + 9
        if rad_extra_media(i,1) ~= 0
            contador(9,1) = contador(9,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(9,1) = contador_extra(9,1) + 1;
        end             
        rad_media_mes(9,1) = rad_media_mes(9,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(9,1) = radextra_media_mes(9,1) + rad_extra_media(i,1);
    elseif i == j + 10
        if rad_extra_media(i,1) ~= 0
            contador(10,1) = contador(10,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(10,1) = contador_extra(10,1) + 1;
        end             
        rad_media_mes(10,1) = rad_media_mes(10,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(10,1) = radextra_media_mes(10,1) + rad_extra_media(i,1);
    elseif i == j + 11
        if rad_extra_media(i,1) ~= 0
            contador(11,1) = contador(11,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(11,1) = contador_extra(11,1) + 1;
        end             
        rad_media_mes(11,1) = rad_media_mes(11,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(11,1) = radextra_media_mes(11,1) + rad_extra_media(i,1);
    elseif i == j + 12
        if rad_extra_media(i,1) ~= 0
            contador(12,1) = contador(12,1) + 1;
        end
        if Trad.MEDIA_RAD(i,1) ~= 0
            contador_extra(12,1) = contador_extra(12,1) + 1;
        end             
        rad_media_mes(12,1) = rad_media_mes(12,1) + Trad.MEDIA_RAD(i,1);
        radextra_media_mes(12,1) = radextra_media_mes(12,1) + rad_extra_media(i,1);
        j = j + 12;
    end   

end

rad_media_mes = rad_media_mes./contador;
radextra_media_mes = radextra_media_mes./contador_extra;
radDiv_mediaMensalAnual = rad_media_mes./radextra_media_mes; % H/Ho