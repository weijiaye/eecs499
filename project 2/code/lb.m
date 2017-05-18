function ly = lb ( x, y , lower_bound)
ye = 0;
for i = 1:10
    if lower_bound(i,5) == 1
        yc = lower_bound(i,2) + (lower_bound(i,4)-lower_bound(i,2))*(x-lower_bound(i,1))/(lower_bound(i,3)-lower_bound(i,1));
        if (yc < y)&&(yc > ye)
            ye = yc;
        end
    end
end
ly = (y + ye)/2;
line([x,x],[y,ye]);