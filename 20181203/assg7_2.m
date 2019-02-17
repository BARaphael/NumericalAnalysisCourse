A=[ 31 -13 0 0 0 -10 0 0 0 ;-13 35 -9 0 -11 0 0 0 0 ;0 -9 31 -10 0 0 0 0 0;0 0 -10 79 -30 0 0 0 -9;0 0 0 -30 57 -7 0 -5 0;0 0 0 0 -7 47 -30 0 0;0 0 0 0 0 -30 41 0 0;0 0 0 0 -5 0 0 27 -2;0 0 0 -9 0 0 0 -2 29];
b=[-15 27 -23 0 -20 12 -7 7 10]';
n = length(b);
x0=[0 0 0 0 0 0 0 0 0]';
w=(0.02:0.02:1.98);

for wn = 1:length(w)
    xk=x0;
    xk_=xk-1;
    k(wn)=0;
    while  max(abs(xk-xk_))>1e-7
        xk_=xk;
        for i = 1:n
            xk(i)=0;
            for j = 1:i-1
                xk(i)=xk(i)-A(i,j)*xk(j);
            end
            for j = i+1:n
                xk(i)=xk(i)-A(i,j)*xk_(j);
            end
            xk(i)=xk(i)+b(i);
            xk(i)=xk(i)/A(i,i);
            xk(i)=(1-w(wn))*xk_(i)+w(wn)*xk(i);
        end
        k(wn)=k(wn)+1;
    end
    fprintf("w=%.2f，迭代步数k=%d",w(wn),k(wn));
    for i = 1:n
        fprintf(",x%d=%.15e",i,xk(i))
    end
    fprintf("\n")
end
[kmin,km]=min(k);
fprintf("最佳松弛因子w=%.2f\n",w(km))