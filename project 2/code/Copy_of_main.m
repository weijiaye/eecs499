%%
%step 1: build map and obstacle
mapSize = 30;
    mapMatrix = zeros(mapSize,mapSize);

    ax = axes('Xlim',[0,30],'Ylim',[0,30]);
    hold on;
%%in matrix c 1:left 2:right 3:up 4:down 5:lefthollow 6:righthollow 
X = [2 3 4 5 0 0;
    6 7 8 9 10 11;
    12 16 13 0 0 0;
    15 20 18 19 17 0;
    21 25 26 22 23 0];

Y = [7 6 4 10 0 0;
    21 14 16 17 15 19;
    6 7 12 0 0 0;
    12 15 17 19 22 0;
    17 19 23 22 20 0];

A = [1 4 4 2 0 0;
    1 4 4 4 4 2;
    1 2 3 0 0 0;
    1 2 6 2 3 0;
    1 4 2 1 5 0];

B = [4 6 3 5 5];

for i = 1:5
    patch(X(i,1:B(i)),Y(i,1:B(i)),[0 0 0]); 
end
        

%% set location
%set start location and goal location
sp = [1,20]; 
Sp= plot (sp(1),sp(2),'o','markersize',10,'markeredgecolor','k','markerfacecolor','y');

gp = [27,15]; 
Gp= plot (gp(1),gp(2),'o','markersize',10,'markeredgecolor','k','markerfacecolor','g');
 
%%end

%%
x_rmp(1) = sp(1);
y_rmp(1) = sp(2);
x_rmp(2) = gp(1);
y_rmp(2) = gp(2);
i = 3;                                                                     %roadmap点集编号
upper_bound = zeros(10,5);
lower_bound = zeros(10,5);
upper_bound(1,:) = [0 30 30 30 1];
lower_bound(1,:) = [0 0 30 0 1];
pause(5);
for n = 1:30                                                               %大循环
    pause(0.1);
    for m = 1:size(A,1)                                                    %障碍物循环
        for k = 1:size(A,2)                                                %障碍物内部点循环
            if A(m,k) ~= 0                                                 %点存在
                if X(m,k) == n                                             %判断x坐标
                    if A(m,k) == 1                                         %如果是左边界
                        x_rmp(i) = n;                                      %向上生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = ub(n, Y(m,k), upper_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy > (Y(m,k) + 0.5)
                            y_rmp(i+1) = Y(m,k) + 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        x_rmp(i) = n;                                      %向下生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = lb(n, Y(m,k), lower_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy < (Y(m,k) - 0.5)
                            y_rmp(i+1) = Y(m,k) - 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        for l = 1:10                                       %添加上边界
                            if upper_bound(l,5) == 0
                                upper_bound(l,1) = n;
                                upper_bound(l,2) = Y(m,k);
                                if (k < size(A,2)) || (A(m,k+1) ~= 0)
                                    upper_bound(l,3) = X(m,k+1);
                                    upper_bound(l,4) = Y(m,k+1);
                                else
                                    upper_bound(l,3) = X(m,1);
                                    upper_bound(l,4) = Y(m,1);
                                end
                                upper_bound(l,5) = 1;
                                line([upper_bound(l,1),upper_bound(l,3)],[upper_bound(l,2),upper_bound(l,4)]);
                                break
                            end
                        end
                        for l = 1:10                                       %添加下边界
                            if lower_bound(l,5) == 0
                                lower_bound(l,1) = n;
                                lower_bound(l,2) = Y(m,k);
                                if k > 1
                                    lower_bound(l,3) = X(m,k-1);
                                    lower_bound(l,4) = Y(m,k-1);
                                else
                                    for o = size(A,2):-1:1
                                        if A(m,o) ~= 0
                                            lower_bound(l,3) = X(m,o);
                                            lower_bound(l,4) = Y(m,o);
                                            break
                                        end
                                    end
                                end
                                lower_bound(l,5) = 1;
                                line([lower_bound(l,1),lower_bound(l,3)],[lower_bound(l,2),lower_bound(l,4)]);
                                break
                            end
                        end
                    elseif A(m,k) == 2                                     %如果是右边界
                        x_rmp(i) = n;                                      %向上生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = ub(n, Y(m,k), upper_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy > (Y(m,k) + 0.5)
                            y_rmp(i+1) = Y(m,k) + 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        x_rmp(i) = n;                                      %向下生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = lb(n, Y(m,k), lower_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy < (Y(m,k) - 0.5)
                            y_rmp(i+1) = Y(m,k) - 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        for l = 1:10                                       %清除上边界
                            if (upper_bound(l,3) == X(m,k))&&(upper_bound(l,4) == Y(m,k))
                                upper_bound(l,:) = 0;
                                break
                            end
                        end
                        for l = 1:10                                       %清除下边界
                            if (lower_bound(l,3) == X(m,k))&&(lower_bound(l,4) == Y(m,k))
                                lower_bound(l,:) = 0;
                                break
                            end
                        end
                    elseif A(m,k) == 3                                     %如果是上边界
                        x_rmp(i) = n;                                      %向上生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = ub(n, Y(m,k), upper_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy > (Y(m,k) + 0.5)
                            y_rmp(i+1) = Y(m,k) + 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        for l = 1:10                                       %清除下边界
                            if (lower_bound(l,3) == X(m,k))&&(lower_bound(l,4) == Y(m,k))
                                lower_bound(l,:) = 0;
                                break
                            end
                        end
                        for l = 1:10                                       %添加下边界
                            if lower_bound(l,5) == 0
                                lower_bound(l,1) = n;
                                lower_bound(l,2) = Y(m,k);
                                if k > 1
                                    lower_bound(l,3) = X(m,k-1);
                                    lower_bound(l,4) = Y(m,k-1);
                                else
                                    for o = size(A,2):-1:1
                                        if A(m,o) ~= 0
                                            lower_bound(l,3) = X(m,o);
                                            lower_bound(l,4) = Y(m,o);
                                            break
                                        end
                                    end
                                end
                                lower_bound(l,5) = 1;
                                line([lower_bound(l,1),lower_bound(l,3)],[lower_bound(l,2),lower_bound(l,4)]);
                                break
                            end
                        end
                    elseif A(m,k) == 4                                     %如果是下边界
                        x_rmp(i) = n;                                      %向下生成cell节点
                        x_rmp(i+1) = n;
                        y_rmp(i) = lb(n, Y(m,k), lower_bound);
                        yy = (y_rmp(i) + Y(m,k))/2;
                        if yy < (Y(m,k) - 0.5)
                            y_rmp(i+1) = Y(m,k) - 0.5;
                        else
                            y_rmp(i+1) = yy;
                        end
                        plot(x_rmp(i),y_rmp(i),'o','color','r');
                        plot(x_rmp(i+1),y_rmp(i+1),'o','color','r');
                        i = i + 2;
                        for l = 1:10                                       %清除上边界
                            if (upper_bound(l,3) == X(m,k))&&(upper_bound(l,4) == Y(m,k))
                                upper_bound(l,:) = 0;
                                break
                            end
                        end
                        for l = 1:10                                       %添加上边界
                            if upper_bound(l,5) == 0
                                upper_bound(l,1) = n;
                                upper_bound(l,2) = Y(m,k);
                                if (k < size(A,2)) || (A(m,k+1) == 1)
                                    upper_bound(l,3) = X(m,k+1);
                                    upper_bound(l,4) = Y(m,k+1);
                                else
                                    upper_bound(l,3) = X(m,1);
                                    upper_bound(l,4) = Y(m,1);
                                end
                                upper_bound(l,5) = 1;
                                line([upper_bound(l,1),upper_bound(l,3)],[upper_bound(l,2),upper_bound(l,4)]);
                                break
                            end
                        end
                    elseif A(m,k) == 5                                     %如果是左凹陷
                        for l = 1:10                                       %清除上边界
                            if (upper_bound(l,3) == X(m,k))&&(upper_bound(l,4) == Y(m,k))
                                upper_bound(l,:) = 0;
                                break
                            end
                        end
                        for l = 1:10                                       %清除下边界
                            if (lower_bound(l,3) == X(m,k))&&(lower_bound(l,4) == Y(m,k))
                                lower_bound(l,:) = 0;
                                break
                            end
                        end
                    else                                                   %如果是右凹陷
                        for l = 1:10                                       %添加上边界
                            if upper_bound(l,5) == 0
                                upper_bound(l,1) = n;
                                upper_bound(l,2) = Y(m,k);
                                if (k < size(A,2)) || (A(m,k+1) == 1)
                                    upper_bound(l,3) = X(m,k+1);
                                    upper_bound(l,4) = Y(m,k+1);
                                else
                                    upper_bound(l,3) = X(m,1);
                                    upper_bound(l,4) = Y(m,1);
                                end
                                upper_bound(l,5) = 1;
                                line([upper_bound(l,1),upper_bound(l,3)],[upper_bound(l,2),upper_bound(l,4)]);
                                break
                            end
                        end
                        for l = 1:10                                       %添加下边界
                            if lower_bound(l,5) == 0
                                lower_bound(l,1) = n;
                                lower_bound(l,2) = Y(m,k);
                                if k > 1
                                    lower_bound(l,3) = X(m,k-1);
                                    lower_bound(l,4) = Y(m,k-1);
                                else
                                    for o = size(A,2):-1:1
                                        if A(m,o) ~= 0
                                            lower_bound(l,3) = X(m,o);
                                            lower_bound(l,4) = Y(m,o);
                                            break
                                        end
                                    end
                                end
                                lower_bound(l,5) = 1;
                                line([lower_bound(l,1),lower_bound(l,3)],[lower_bound(l,2),lower_bound(l,4)]);
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end

%%
collision = 0;
C = zeros(size(x_rmp,2),size(x_rmp,2));
for i = 1:size(x_rmp,2)
    for j = 1:size(x_rmp,2)
        if i == j
            continue
        end
        for k = 1:size(A,1)
            for n = 1:size(A,2)
                collision = 0;
                if X(k,n) == 0
                    break
                end
                x1 = x_rmp(i) - X(k,n);
                y1 = y_rmp(i) - Y(k,n);
                x2 = x_rmp(j) - X(k,n);
                y2 = y_rmp(j) - Y(k,n);
                x4 = X(k,n) - x_rmp(i);
                y4 = Y(k,n) - y_rmp(i);
                x6 = x_rmp(j) - x_rmp(i);
                y6 = y_rmp(j) - y_rmp(i);
                if (n == size(A,2))||(X(k,n + 1) == 0)
                    x3 = X(k,1) - X(k,n);
                    y3 = Y(k,1) - Y(k,n);
                    x5 = X(k,1) - x_rmp(i);
                    y5 = Y(k,1) - y_rmp(i);
                else
                    x3 = X(k,n+1) - X(k,n);
                    y3 = Y(k,n+1) - Y(k,n);
                    x5 = X(k,n+1) - x_rmp(i);
                    y5 = Y(k,n+1) - y_rmp(i);
                end
                a1 = x1 * y3 - x3 * y1;
                b1 = x3 * y2 - x2 * y3;
                a2 = x4 * y6 - x6 * y4;
                b2 = x6 * y5 - x5 * y6;
                if (a1 * b1 > 0)&&(a2 * b2 > 0)
                    collision = 1;
                    break
                end
            end
            if collision == 1
                break
            end
        end
        if collision == 0
            line([x_rmp(i),x_rmp(j)],[y_rmp(i),y_rmp(j)]);
            for l = 1:size(x_rmp,2)
                if C(i,l) == j
                    break
                end
                if C(i,l) == 0
                    C(i,l) = j;
                    break
                end
            end
            for l = 1:size(x_rmp,2)
                if C(j,l) == i
                    break
                end
                if C(j,l) == 0
                    C(j,l) = i;
                    break
                end
            end
        end
        pause(0.01);
    end
end


