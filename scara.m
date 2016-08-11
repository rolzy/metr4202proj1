function [P] =scara(theta,phi,z)

L1=5; %Length of arm 1
L2=5; %Length of arm 2
d1=5; %Horisontal position of base
d2=0; %Vertical position of base


P=[L1*cosd(theta)+L2*cosd(theta+phi)+d1 , L1*sind(theta)+L2*sind(theta+phi)+d2,z];
end