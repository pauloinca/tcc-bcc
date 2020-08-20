function [angulo] = f_angdecl(dia,mes)
%funçao que retorna em graus
if(strcmp(mes,'-01-'))
    angulo = 23.45*(sind(360*((284+dia)/365)));
elseif (strcmp(mes,'-02-'))
    angulo = 23.45*(sind(360*((284+31+dia)/365)));
elseif (strcmp(mes,'-03-'))
    angulo = 23.45*(sind(360*((284+59+dia)/365)));
elseif (strcmp(mes,'-04-'))
    angulo = 23.45*(sind(360*((284+90+dia)/365)));   
elseif (strcmp(mes,'-05-'))
    angulo = 23.45*(sind(360*((284+120+dia)/365)));
elseif (strcmp(mes,'-06-'))
    angulo = 23.45*(sind(360*((284+151+dia)/365)));
elseif (strcmp(mes,'-07-'))
    angulo = 23.45*(sind(360*((284+181+dia)/365)));
elseif (strcmp(mes,'-08-'))
    angulo = 23.45*(sind(360*((284+212+dia)/365)));
elseif (strcmp(mes,'-09-'))
    angulo = 23.45*(sind(360*((284+243+dia)/365)));
elseif (strcmp(mes,'-10-'))
    angulo = 23.45*(sind(360*((284+273+dia)/365)));
elseif (strcmp(mes,'-11-'))
    angulo = 23.45*(sind(360*((284+304+dia)/365)));
elseif (strcmp(mes,'-12-'))
    angulo = 23.45*(sind(360*((284+334+dia)/365)));   
end

end

