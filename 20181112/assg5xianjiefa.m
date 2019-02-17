f=@(x) x^3/3-x;
g=@(xk,xk_1)xk-f(xk)*(xk-xk_1)/(f(xk)-f(xk_1));
inputx = [-0.1 -0.2 -2.0 0.9];
inputx1 = [0.1 0.2 0.9 9.0];
epsilon=1e-8;
for i = [1:length(inputx)]
    x = inputx(i);
    x1 = inputx1(i);
    x2 = g(x1,x);
    n = 1;
    stepp=Inf;
    stepa =Inf;
    while abs(x2 - x1)>epsilon
        x=x1;
        x1=x2;
        x2=g(x1,x);
        n=n+1;
        stepp = stepa;
        stepa = log(abs(x2-x1))/log(abs(x2-x));
    end
    fprintf("初值 x0 = %.15e , x1 = %.15e , 根 = %.15e , 迭代步数 = %d",inputx(i),inputx1(i),x2,n)
    if stepa == Inf
        fprintf(",收敛阶 = %.15e\n",stepp)
    else
        fprintf(",收敛阶 = %.15e\n",stepa)
    end
end