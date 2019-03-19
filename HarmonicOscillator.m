syms x;
a=9;
b=0;
c=10;
d=3;
Ea=(a+0.5)*2;
Eb=(b+0.5)*2;
t=5;
psi_without_normalization=(c*wave(a)*exp(-1i*Ea*t) + d*wave(b)*exp(-1i*Eb*t));
psi = (1/sqrt((c^2)+(d^2)))*(c*wave(a)*exp(-1i*Ea*t) + d*wave(b)*exp(-1i*Eb*t));
z1=simplify(psi_without_normalization);
z2=simplify(psi);
z3=simplify(abs(psi)*abs(psi));
prob = abs(psi)*abs(psi);
simplify(prob);
fplot(prob);
%fplot(abs(psi));

vpaintegral(prob,-Inf, Inf) %to verify normalization. This should print 1


function wavefunc = wave(k)
    syms x;
    psi_0 = (2/pi)^(1/4)*exp(-x^2);
    n=k;
    psi_n = psi_0;
    for i = 1:n
        psi_n = aplus(psi_n) / (i^0.5);
    end
    wavefunc = psi_n;
end
function ap = aplus(psi)
    syms x;
    ap = x*psi - 0.5*diff(psi);
end