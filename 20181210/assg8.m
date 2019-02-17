A = [ 3 2 5 4 6;2 1 3 -7 8;5 3 2 5 -4;4 -7 5 1 3;6 8 -4 3 8];
n = length(A);
Ak=A;
B = eye(n,n);
while max(max(abs(Ak - diag(diag(Ak)))))>1e-6
    Ap = Ak - diag(diag(Ak));
    maxvalue=max(max(abs(Ap)));
    [p,q]=find(abs(Ap)==maxvalue,1);
    if p>q
        t=p;
        p=q;
        q=t;
    elseif q==p
        q=q+1;
    end
    s = (Ak(q,q)-Ak(p,p))/(2*Ak(p,q));
    if s==0
        t=1;
    else
        t1 = -s-sqrt(s^2+1);
        t2 = -s+sqrt(s^2+1);
        if abs(t1)>abs(t2)
            t=t2;
        else
            t=t1;
        end
    end
    c=1/sqrt(1+t^2);
    d=t/sqrt(1+t^2);
    Q=eye(n,n);
    Q(p,p)=c;
    Q(q,q)=c;
    Q(p,q)=d;
    Q(q,p)=-d;
    Ak=Q'*Ak*Q;
    B=B*Q;
end
diagA=diag(Ak);
for i = 1:n
    fprintf("特征值r%d=%.15e，特征向量v%d=[",i,diagA(i),i)
    for j = 1:n
        fprintf("%.15e ",B(j,i));
    end
    fprintf("]\n");
end