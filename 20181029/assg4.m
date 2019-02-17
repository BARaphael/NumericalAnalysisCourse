if ~exist('f','var')
    f = @(x) sin(x);
    fprintf("没有输入f(x),已使用默认函数f(x)=sin(x)，若要更改函数请以匿名函数形式输入。例如：\n    >>f = @(x) sin(x);\n")
else
    fprintf("已输入的函数为")
    f
end
if ~exist('a','var')
    a = 1;
    fprintf("没有输入积分下限a,已使用默认值 a = 1，若要更改值请以自行输入。例如：\n    >>a = 1;\n")
else
    fprintf("积分下限 a = %d\n",a)
end
if ~exist('b','var')
    b = 5;
    fprintf("没有输入积分上限b,已使用默认值 b = 5，若要更改值请以自行输入。例如：\n    >>b = 5;\n")
else
    fprintf("积分下限 b = %d\n",b)
end
Tn = 0;
err=0;
for L = [ 1 : 12 ]
    N = 2 ^ L +1;
    h = ( b - a ) / (N-1);
    x = [ a : h : b ];
    LastTn = Tn;
    Tn = h*(sum(f(x))- 0.5 * f(a) - 0.5 * f(b));
    Lasterr=err;
    err = abs((Tn - LastTn) / 3);
    o_k = log(Lasterr/err)/log(2);
    if L>2
        fprintf(",o_k = %.15e",o_k);
    end
    fprintf("\nL = %-2d ,N = %-4d, Tn = %.15e",L,N,Tn)
    if L>1
        fprintf(",err = %.15e",err)
    end
end
Sn = 0;
for L = [1 : 12 ]
    N = 2 ^ L + 1 ;
    h = ( b - a ) / (N-1);
    x = [ a : h : b ];
    LastSn = Sn;
    an = [1];
    for i = [1:(N-3)/2]
        an = [an 4 2];
    end
    an = [an 4 1];
    Sn = h * (sum(an.*f(x))) / 3;
    Lasterr=err;
    err = abs((Sn - LastSn) /15);
    o_k = log(Lasterr/err)/log(2);
    if L>2
        fprintf(",o_k = %.15e",o_k);
    end
    fprintf("\nL = %-2d ,N = %-4d, Sn = %.15e",L,N,Sn)
    if L>1
        fprintf(",err = %.15e",err)
    end
end
fprintf("\n")
clear