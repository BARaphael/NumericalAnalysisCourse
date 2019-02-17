A=[ 31 -13 0 0 0 -10 0 0 0 ;-13 35 -9 0 -11 0 0 0 0 ;0 -9 31 -10 0 0 0 0 0;0 0 -10 79 -30 0 0 0 -9;0 0 0 -30 57 -7 0 -5 0;0 0 0 0 -7 47 -30 0 0;0 0 0 0 0 -30 41 0 0;0 0 0 0 -5 0 0 27 -2;0 0 0 -9 0 0 0 -2 29];
b=[-15 27 -23 0 -20 12 -7 7 10];
n = length(b);
for i = 1:n
    Ai = A(i:n,i);
    [maxA,maxnum] = max(Ai);
    maxnum=maxnum+i-1;
    temp1 = b(i);
    b(i) = b(maxnum);
    b(maxnum) = temp1;
    temp2 = A(i,i:n);
    A(i,i:n)=A(maxnum,i:n);
    A(maxnum,i:n)=temp2;
    
    for j = 1:n
        if j~=i 
            b(j) = b(j) - b(i) * A(j,i)/A(i,i);
            A(j,i:n) = A(j,i:n) - A(i,i:n) * A(j,i)/A(i,i); 
        end
    end
end
for i = 1:n
    b(i)=b(i)/A(i,i);
    A(i,i)=1;
    fprintf("x%d=%.15e",i,b(i))
    if i < n
        fprintf(",")
    else
        fprintf("\n")
    end
end

