x = [0.25 0.50 0.75 1.00 1.25 1.50 1.75 2.00 2.25 2.50];
y = [1.284 1.648 2.117 2.718 3.427 2.798 3.534 4.456 5.465 5.894];
sinsqr = sum(sin(x).^2);
sincos = sum(sin(x).*cos(x));
cossqr = sum(cos(x).^2);
siny = sum(sin(x).*y);
cosy = sum(cos(x).*y);
ans0 = linsolve([sinsqr,sincos;sincos,cossqr],[siny;cosy]);
a = ans0(1);
b = ans0(2);
err = sum( (a * sin(x) + b * cos(x) - y).^2)/10;
fprintf("a=%.15f,b=%.15f,¾ù·½Îó²îÎª%.15f\n",a,b,err);

