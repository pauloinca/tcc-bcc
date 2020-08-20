function [final] = f_convertelati(graus,minutos,hemisferio)
if(hemisferio == 'S')
    d = graus*(-1);
    min = minutos*(-1);
else
    d = graus*(+1);
    min = minutos*(+1);
end

% Latitude no hemisfério Sul (S) sempre negativo
% d = dia, min = minutos, sec = segundos, lati_radi = latitude em radianos
dd = d + (min/60);
%lati_rad = (pi/180)*dd;
final = dd;
end

