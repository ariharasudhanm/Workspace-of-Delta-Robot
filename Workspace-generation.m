1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
clc;clear;
%all units in inches and degrees
figure;
L=18+.6; %length of leg
%L=13.6;
ThLim=22; %joint limit of 
ThR=62.75; %angle of rest (measured clockwise from horizontal)
OP=1.2515; %offset due to the platform
OC=1.69+.5838; %offset due to the carriage+width of t slot
IR=L*sind(90-ThLim-ThR)
OR=L*sind(90+ThLim-ThR)
theta = 0 : 0.01 : 2*pi;
%draw the outline of the frame
x1=[-11.39 -11.39];
y1=[-6.58 6.58];
x2=[-11.39 0];
y2=[6.58 13.15];
x3=[0 11.39];
y3=[13.15 6.58];
x4=[11.39 11.39];
y4=[6.58 -6.58];
x5=[11.39 0];
y5=[-6.58 -13.15];
x6=[0 -11.39];
y6=[-13.15 -6.58];
plot(x1, y1,'r', x2, y2,'r', x3, y3,'r', x4, y4,'r', x5, y5,'r', x6, y6,'r');
axis equal;
hold on;
%offset vectors
x7=[-11.39 -11.39+OC+OP];
y7=[0 0];
x8=[11.39/2 11.39/2-(OP+OC)*sind(30)];
y8=[6.58+(13.15-6.58)/2 (6.58+(13.15-6.58)/2)-(OP+OC)*cosd(30)];
x9=[11.39/2 11.39/2-(OP+OC)*sind(30)];
y9=[-(6.58+(13.15-6.58)/2) -((6.58+(13.15-6.58)/2)-(OP+OC)*cosd(30))];
plot(x7, y7,'r', x8, y8,'r', x9, y9,'r')

%length of triangle
trileg=sqrt((abs(x7(2))+abs(x8(2)))^2+y8(2)^2)
%make the circles
x1Center=x7(2);
y1Center=0;
x2Center=x8(2);
y2Center=y8(2);
x3Center=x9(2);
y3Center=y9(2);
xc1=IR*cos(theta)+x1Center;
yc1=IR*sin(theta)+y1Center;
xc2=IR*cos(theta)+x2Center;
yc2=IR*sin(theta)+y2Center;
xc3=IR*cos(theta)+x3Center;
yc3=IR*sin(theta)+y3Center;
plot(xc1, yc1,'g', xc2, yc2,'b', xc3, yc3, 'r');

xc1=OR*cos(theta)+x1Center;
yc1=OR*sin(theta)+y1Center;
xc2=OR*cos(theta)+x2Center;
yc2=OR*sin(theta)+y2Center;
xc3=OR*cos(theta)+x3Center;
yc3=OR*sin(theta)+y3Center;
plot(xc1, yc1,'g', xc2, yc2,'b', xc3, yc3, 'r');

xlim([-15 15]);
ylim([-15 15]);
WorkRad=x7(2)+IR;
WorkDiam=abs(WorkRad*2)
xc=WorkRad*cos(theta);
yc=WorkRad*sin(theta);
plot(xc, yc, 'c');
xlabel('X (inches)');
ylabel('Y (inches)');
title('Usable Work Space');
