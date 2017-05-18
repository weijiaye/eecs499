function uy = ub ( x, y , upper_bound)
ye = 30;
for i = 1:10
    if upper_bound(i,5) == 1
        yc = upper_bound(i,2) + (upper_bound(i,4)-upper_bound(i,2))*(x-upper_bound(i,1))/(upper_bound(i,3)-upper_bound(i,1));
        if (yc > y)&&(yc < ye)
            ye = yc;
        end
    end
end
uy = (y + ye)/2;
line([x,x],[y,ye]);