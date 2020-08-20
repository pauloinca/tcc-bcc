function [omega] = f_horaangsol(fi,delta)
%FUNC_SUNSETHOURANGLE Summary of this function goes here
%   Detailed explanation goes here
omega = acosd(-tand(fi)*tand(delta));
end

