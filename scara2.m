function [P] =scara2(x1,y1,z)

%variable inputs
L1=10; %Length of arm 1
L2=10; %Length of arm 2
d1=5; %Horisontal position of base
d2=-2; %Vertical position of base

%origin translation
x=x1-d1;
y=y1-d2;

%relection kinematics calcs (for quadrant 2)
if x<0
    x=-x;
    a=-1;
else
    a=1;
end

%inverse kinematics calcs (accurate for quadrant 1 only)
phi=(acosd((x^2+y^2-L1^2-L2^2)/(2*L1*L2)));
theta=-asind((L2*sind(-phi))/(x^2+y^2)^0.5)+atand(y/x);

%relection kinematics calcs (for quadrant 2)
if a==-1;
    phi=-phi;
    theta=180-theta;
end

%output angles
P=[theta,phi,z];

%plots
hold on
scatter(x1,y1)
scatter(d1,d2)
a=[d1,L1*cosd(theta)+d1];
b=[d2,L1*sind(theta)+d2];
c=[L1*cosd(theta)+d1,L1*cosd(theta)+L2*cosd(theta-phi)+d1];
d=[L1*sind(theta)+d2,L1*sind(theta)+L2*sind(theta-phi)+d2];
plot(a,b)
plot(c,d)
hold off

%check lengths of beams to verify calculations
((L1*cosd(theta))^2+(L1*sind(theta))^2)^0.5;
((L2*sind(theta-phi))^2+(L2*cosd(theta-phi))^2)^0.5;


end