if ~exist('f','var')
    f = @(x) sin(x);
    fprintf("û������f(x),��ʹ��Ĭ�Ϻ���f(x)=sin(x)����Ҫ���ĺ�����������������ʽ���롣���磺\n    >>f = @(x) sin(x);\n")
else
    fprintf("������ĺ���Ϊ")
    f
end
if ~exist('a','var')
    a = 1;
    fprintf("û�������������a,��ʹ��Ĭ��ֵ a = 1����Ҫ����ֵ�����������롣���磺\n    >>a = 1;\n")
else
    fprintf("�������� a = %d\n",a)
end
if ~exist('b','var')
    b = 5;
    fprintf("û�������������b,��ʹ��Ĭ��ֵ b = 5����Ҫ����ֵ�����������롣���磺\n    >>b = 5;\n")
else
    fprintf("�������� b = %d\n",b)
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