%1.3.2

%X(z) parameters
a1 = [10 0]; %num
b1 = [1 -3 2]; %den
%X(z)/z parameters
a2 = [10]; %num
b2 = [1 -3 2]; %den

[r1,p1,k1] = residue(a1,b1);
sprintf('r1:%.1f\n',r1);
sprintf('p1:%.1f\n',p1);
sprintf('k1:%.1f\n',k1);
[r2,p2,k2] = residue(a2,b2);
sprintf('r2:%.1f\n',r1);
sprintf('p2:%.1f\n',p1);
sprintf('k2:%.1f\n',k1);

syms z k;

%X(z) invz
sys1 = r1(1)/(z-p1(1)) + r1(2)/(z-p1(2));
xk1 = iztrans(sys1,k);
%X(z)/z invz
sys2 = (r2(1)*z)/(z-p2(1)) + (r2(2)*z)/(z-p2(2));
xk2 = iztrans(sys2,k);
