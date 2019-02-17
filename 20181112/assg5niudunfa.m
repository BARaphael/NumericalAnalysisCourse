f=@(x) x^3/3-x;
df=@(x)x^2-1;
inputx=[0.1 0.2 0.9 9.0];
g=@(x)x-f(x)/df(x);
epsilon=1e-8;
for i = 1:length(inputx)
    x = inputx(i);
    x1 = g(x);
    x2 = g(x1);
    n = 2;
    stepp=Inf;
    stepa=Inf;
    while abs(x2 - x1)>epsilon
        x=x1;
        x1=x2;
        x2=g(x1);
        n=n+1;
        stepp = stepa;
        stepa = log(abs(x2-x1))/log(abs(x2-x));    
    end
    fprintf("��ֵ = %.15e , �� = %.15e , �������� = %d",inputx(i),x2,n)
    if stepa == Inf
        fprintf(",������ = %.15e\n",stepp)
    else
        fprintf(",������ = %.15e\n",stepa)
    end
end
