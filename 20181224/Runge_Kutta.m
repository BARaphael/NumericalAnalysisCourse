f=@(x,y)-x^2*y^2;

for l=(0:4)
    h=0.1/2^l;
    y=3;
    y0=3/(1+1.5^3);
    for x = (0:h:1.5-h)
        k1=f(x,y);
        k2=f(x+0.5*h,y+0.5*h*k1);
        k3=f(x+0.5*h,y+0.5*h*k2);
        k4=f(x+h,y+h*k3);
        y=y+h/6*(k1+2*k2+2*k3+k4);
    end
    if l ~= 0
        fprintf("ok=%.15e\n",log(err/(y0-y))/log(2))
    end
    err = y0-y;
    if l~=4
        fprintf("h=%.15e,err=%.15e,",h,err);
    end
end