input = [0.0 0.5 1.0 sqrt(2) 10.0 100.0 300.0];
num = length(input);
f=@(x)@(k)1./(k*(k+x));
g=f(input);
re=linspace(0,0,num);
for i = 1:1000000
    re=re+g(i);
end
for i = 1:num
    fprintf("x=%-6.1f,y=%.15e\n",input(i),re(i))
end

