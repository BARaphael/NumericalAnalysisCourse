f=@(x) 1/(1+x^2);
x1=@(n)@(i) -5+10*i/n;
x2=@(n)@(i) -5*cos((2*i+1)*3.1415926/(2*n+2));
y=@(j) -5+10*j/500;
for q = 1:2
    switch q
        case 1
            temp = x1;
        case 2
            temp = x2;
    end
    fprintf("函数%d\n",q);
    for n = [5 10 20 40]
        x=temp(n);
        maxerr = 0;
        for j = 0 :500
            Ln = 0;%插值函数
            for i = 0 : n
                li = 1;%基函数
                for p = 0 : i-1
                    li = li*(y(j)-x(p))/(x(i)-x(p));
                end
                for p = i+1 : n
                    li = li*(y(j)-x(p))/(x(i)-x(p));
                end
                Ln = Ln + li * f(x(i));
            end
            err = abs(Ln - f(y(j)));%误差
            maxerr = max(maxerr,err);
        end
        fprintf("节点个数为%2d，近似最大模误差%.15e\n",n,maxerr);
    end
end