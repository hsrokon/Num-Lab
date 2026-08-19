clc; clear all; close all;

x1=0; y1=2;
x2=1; y2=1;
x3=2; y3=0;
x4=3; y4=-1;
 
p1=y1 *conv([1 -x2], conv([1 -x3],[1 -x4]) )...
            /((x1-x2)*(x1-x3)*(x1-x4));
p2=y2 *conv([1 -x1], conv([1 -x3],[1 -x4]) )...
            /((x2-x1)*(x2-x3)*(x2-x4));
p3=y3 *conv([1 -x1], conv([1 -x2],[1 -x4]) )...
            /((x3-x1)*(x3-x2)*(x3-x4));
p4=y4 *conv([1 -x1], conv([1 -x2],[1 -x3]) )...
            /((x4-x1)*(x4-x2)*(x4-x3));
 
p=p1+p2+p3+p4
polyval(p,2)

