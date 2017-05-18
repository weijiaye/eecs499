%%
%step 1: build map and obstacle
mapSize = 30;
    mapMatrix = zeros(mapSize,mapSize);

    ax = axes('Xlim',[0,30],'Ylim',[0,30]);
    hold on;
%%in matrix c 1:left 2:right 3:up 4:down 5:lefthollow 6:righthollow 
    x1=[2 3 4 5 ];
    y1=[7 6 4 10 ];
    c1=[1 4 4 2];
    
    x2=[6 7 8 9 10 11 ];
    y2=[21 14 16 17 15 19];
    c2=[1 4 4 4 4 2];
    
    x3=[12 16 13 ];
    y3=[6 7 12];
    c3=[1 2 3];
    
    x4=[15 20 18 19 17 ];
    y4=[12 15 17 19 22];
    c4=[1 2 6 2 3];
    
    x5=[21 25 26 22 23];
    y5=[17 19 23 22 20];
    c5=[1 4 2 1 5];
    
        patch(x1,y1,[0 0 0]); 
        patch(x2,y2,[0 0 0]);
        patch(x3,y3,[0 0 0]);
        patch(x4,y4,[0 0 0]); 
        patch(x5,y5,[0 0 0]);
%end
        
 %%
 %%%%%distinguish the point style
 
 %%%case1 left point 
 % obstacle 1: left point x1=[2 3 4 5 ];
  xleftpoint_1_1=min(x1(:,1),x1(:,2));
 xleftpoint_1_2=min(x1(:,3),x1(:,4));

if xleftpoint_1_1 < xleftpoint_1_2
     xleftpointObstacle1 = xleftpoint_1_1
else 
    xleftpointObstacle1 = xleftpoint_1_2
end

% obstacle 1: left point y

for a1 = 1:4
    m1=x1(:,a1);
    if xleftpointObstacle1 == m1
        aleft_1 = a1
        yleftpointObstacle1 = y1(:,a1)
    else
    end
end

 %obstacle 2: left point x %%%%x2=[6 7 8 9 10 11];
 xleftpoint_2_1=min(x2(:,1),x2(:,2));
 xleftpoint_2_2=min(x2(:,3),x2(:,4));
 xleftpoint_2_3=min(x2(:,5),x2(:,6));
if xleftpoint_2_1 < xleftpoint_2_2
     xleftpointM2 = xleftpoint_2_1
else 
    xleftpointM2 = xleftpoint_2_2
end
if xleftpointM2 < xleftpoint_2_3
    xleftpointObstacle2=xleftpointM2
else
    xleftpointObstacle2=xleftpoint_2_3
end
%obstacle 2: left point y
for a2 = 1:6
    m2=x2(:,a2);
    if xleftpointObstacle2 == m2
        aleft_2 = a2
        yleftpointObstacle2 = y2(:,a2)
    else
    end
end

%obstacle 3: left point x%%%x3=[12 13 16 ];
 xleftpoint_3_1=min(x3(:,1),x3(:,2));
 
if xleftpoint_3_1 < x3(:,3)
     xleftpointObstacle3 = xleftpoint_3_1
else 
    xleftpointObstacle3 = x3(:,3)
end

%obstacle 3: left point y
 for a3 = 1:3
    m3=x3(:,a3);
    if xleftpointObstacle3 == m3
        aleft_3 = a3
        yleftpointObstacle3 = y3(:,a3)
    else
    end
 end

 %obstacle 4: left point x%% x4=[15 17 19 18 20];
  xleftpoint_4_1=min(x4(:,1),x4(:,2));
 xleftpoint_4_2=min(x4(:,3),x4(:,4));

if xleftpoint_4_1 < xleftpoint_4_2
     xleftpointM4 = xleftpoint_4_1
else 
    xleftpointM4 = xleftpoint_4_2
end
if xleftpointM4 < x4(:,5)
    xleftpointObstacle4=xleftpointM4
else
    xleftpointObstacle4=x4(:,5)
end
         
  %obstacle 4: left point y
 for a4 = 1:5
    m4=x4(:,a4);
    if xleftpointObstacle4 == m4
        aleft_4=a4
        yleftpointObstacle4 = y4(:,a4)
    else
    end
 end   
 
 
 
 %obstacle 5: left point x%%x5=[21 25 26 22 23];
 
  xleftpoint_5_1=min(x5(:,1),x5(:,2));
 xleftpoint_5_2=min(x5(:,3),x5(:,4));

if xleftpoint_5_1 < xleftpoint_5_2
     xleftpointM5 = xleftpoint_5_1
else 
    xleftpointM5 = xleftpoint_5_2
end
if xleftpointM5 < x5(:,5)
    xleftpointObstacle5=xleftpointM5
else
    xleftpointObstacle5=x5(:,5)
end


xleftpointObstacle5_1=x5(:,4)


   %obstacle 5: left point y 
 for a5 = 1:5
    m5=x5(:,a5);
    if xleftpointObstacle5 == m5
        aleft_5=m5
        yleftpointObstacle5 = y5(:,a5)
    else
    end
 end
 
 yleftpointObstacle5_1=y5(:,4)
 
 
 %%%case2 right point 
 % obstacle 1: right point x1=[2 3 4 5 ];
  xrightpoint_1_1=max(x1(:,1),x1(:,2));
 xrightpoint_1_2=max(x1(:,3),x1(:,4));

if xrightpoint_1_1 > xrightpoint_1_2
     xrightpointObstacle1 = xrightpoint_1_1
else 
    xrightpointObstacle1 = xrightpoint_1_2
end

% obstacle 1: right point y

for a1_r = 1:4
    m1_r=x1(:,a1_r);
    if xrightpointObstacle1 == m1_r
        aright_1=a1_r
        yrightpointObstacle1 = y1(:,a1_r)
    else
    end
end

 %obstacle 2: right point x %%%%x2=[7 8 9 10 11 6];
 xrightpoint_2_1=max(x2(:,1),x2(:,2));
 xrightpoint_2_2=max(x2(:,3),x2(:,4));
 xrightpoint_2_3=max(x2(:,5),x2(:,6));
if xrightpoint_2_1 > xrightpoint_2_2
     xrightpointM2 = xrightpoint_2_1
else 
    xrightpointM2 = xleftpoint_2_2
end
if xrightpointM2 > xrightpoint_2_3
    xrightpointObstacle2=xrightpointM2
else
    xrightpointObstacle2=xrightpoint_2_3
end
%obstacle 2: right point y
for a2_r = 1:6
    m2_r=x2(:,a2_r);
    if xrightpointObstacle2 == m2_r
        aright_2=a2_r
        yrightpointObstacle2 = y2(:,a2_r)
    else
    end
end

%obstacle 3: right point x%%%x3=[12 13 16 ];
 xrightpoint_3_1=max(x3(:,1),x3(:,2));
 xrightpointM3=x3(:,3)
if xrightpoint_3_1 > xrightpointM3
     xrightpointObstacle3 = xrightpoint_3_1
else 
    xrightpointObstacle3 = xrightpointM3
end

%obstacle 3: right point x%%%x3=[12 13 16 ];
 xrightpoint_3_1=max(x3(:,1),x3(:,2));
 
if xrightpoint_3_1 > x3(:,3)
     xrightpointObstacle3 = xrightpoint_3_1
else 
    xrightpointObstacle3 = x3(:,3)
end

%obstacle 3: right point y
 for a3_r = 1:3
    m3_r=x3(:,a3_r);
    if xrightpointObstacle3 == m3_r
        aright_3=a3_r
        yrightpointObstacle3 = y3(:,a3_r)
    else
    end
 end

 %obstacle 4: right point x%% x4=[15 17 19 18 20];
  xrightpoint_4_1=max(x4(:,1),x4(:,2));
 xrightpoint_4_2=max(x4(:,3),x4(:,4));

if xrightpoint_4_1 > xrightpoint_4_2
     xrightpointM4 = xrightpoint_4_1
else 
    xrightpointM4 = xrightpoint_4_2
end
if xrightpointM4 > x4(:,5)
    xrightpointObstacle4=xrightpointM4
else
    xrightpointObstacle4=x4(:,5)
end


xrightpointObstacle4_1=x4(:,3)

         
  %obstacle 4: right point y
 for a4_r = 1:5
    m4_r=x4(:,a4_r);
    if xrightpointObstacle4 == m4_r
        aright_4=a4_r
        yrightpointObstacle4 = y4(:,a4_r)
    else
    end
 end   
 
 xrightpointObstacle4_1=y4(:,3)
 
 %obstacle 5: right point x%%x5=[21 25 26 22 23];
 
  xrightpoint_5_1=max(x5(:,1),x5(:,2));
 xrightpoint_5_2=max(x5(:,3),x5(:,4));

if xrightpoint_5_1 > xrightpoint_5_2
     xrightpointM5 = xrightpoint_5_1
else 
    xrightpointM5 = xrightpoint_5_2
end
if xrightpointM5 > x5(:,5)
    xrightpointObstacle5=xrightpointM5
else
    xrightpointObstacle5=x5(:,5)
end

   %obstacle 5: right point y 
 for a5_r = 1:5
    m5_r=x5(:,a5_r);
    if xrightpointObstacle5 == m5_r
        aright_5=a5_r
        yrightpointObstacle5 = y5(:,a5_r)
    else
    end
 end
 
 %%case 3 except left point and right point, all the points are down edge
 %partial down point obstacle 5
 %obstacle 1 and obstcale 2
 %obstacle 1
 for i1 =1:4
     a_m1=y1(:,i1);
     if yleftpointObstacle1 > a_m1 && yrightpointObstacle1 >a_m1
         num_1=2
     end
 end
 xdownpoint1_1=x1(:,2)
 xdownpoint1_2=x1(:,3)
 ydownpoint1_1=y1(:,2)
 ydownpoint1_2=y1(:,3)
 
 % obstacle 2
 for i2 = 1:6
     a_m2 = y2(:,i2);
     if yleftpointObstacle2 >a_m2 && yrightpointObstacle2>a_m2
         num_2=4
     end
 end
 
 xdownpoint2_1=x2(:,2)
 xdownpoint2_2=x2(:,3)
 xdownpoint2_3=x2(:,4)
 xdownpoint2_4=x2(:,5)
 ydownpoint2_1=y2(:,2)
 ydownpoint2_2=y2(:,3)
 ydownpoint2_3=y2(:,4)
 ydownpoint2_4=y2(:,5)
 
 xdownpoint5_1=x5(:,2)
 ydownpoint5_1=y5(:,2)
 
 %%%end
 
 %%case 4 up edge
 %partial up obstacle 4 and obstacle 5
 %obstacle 3 expect leftpoint and rightpoint, all the point are higher than edge
 
 for i3 = 1:3
     a_m3=y3(:,i3)
     if yrightpointObstacle3<a_m3 && yleftpointObstacle3<a_m3
         num_3=1
     end
 end
 
 xuppoint3_1=x3(:,3)
 yuppoint3_1=y3(:,3)
 
 xuppoint4_1=x4(:,5)
 xrightpointObstacle4_1=x4(:,4)

 yuppoint4_1=y4(:,5)
 yrightpointObstacle4_1=y4(:,4)
 
 xleftpointObstacle5_1=x5(:,4)
 yleftpointObstacle5_1=x5(:,4)
 %obstacle 4 and obstacle 5
 
 %%%end
 %%% case 5
 %obstacle 4
 
 xrmidpoint4_1=x4(:,3)
 yrmidpoint4_1=y4(:,3)
 
 %%%% case 6
 %obstacle 5
 
 xlmidpoint5_1=x5(:,5)
 ylmidpoint5_1=y5(:,5)
         
 %%%end 
 %% set location
 %set start location and goal location
 
 Sp= plot (1,20,'o','markersize',5,'markeredgecolor','k','markerfacecolor','r')
 sp = [1,20]
 
 Gp= plot (28,28,'o','markersize',5,'markeredgecolor','k','markerfacecolor','r')
 gp = [28,28]
 
 %%%end
 %% vertical 
 
 %left point and right point 
 line([xleftpointObstacle1,xleftpointObstacle1],[0,mapSize])
 line([xrightpointObstacle1,xrightpointObstacle1],[0,mapSize])
 line([xleftpointObstacle2,xleftpointObstacle2],[0,mapSize])
 line([xrightpointObstacle2,xrightpointObstacle2],[0,mapSize])
 line([xleftpointObstacle3,xleftpointObstacle3],[0,mapSize])
 line([xrightpointObstacle3,xrightpointObstacle3],[0,12.6])
 line([xleftpointObstacle4,xleftpointObstacle4],[12,mapSize])
 line([xrightpointObstacle4,xrightpointObstacle4],[0,mapSize])
 line([xleftpointObstacle5,xleftpointObstacle5],[0,mapSize])
 line([xrightpointObstacle5,xrightpointObstacle5],[0,mapSize])
 
 %down point 
 %obstacle 1 and 2
 line([xdownpoint1_1,xdownpoint1_1],[0,ydownpoint1_1])
 line([xdownpoint1_2,xdownpoint1_2],[0,ydownpoint1_2])
 line([xdownpoint2_1,xdownpoint2_1],[0,ydownpoint2_1])
 line([xdownpoint2_2,xdownpoint2_2],[0,ydownpoint2_2])
 line([xdownpoint2_3,xdownpoint2_3],[0,ydownpoint2_3])
 line([xdownpoint2_4,xdownpoint2_4],[0,ydownpoint2_4])
 line([xrightpointObstacle4_1,xrightpointObstacle4_1],[16 yrightpointObstacle4_1])
 line([xleftpointObstacle5_1,xleftpointObstacle5_1],[18.5 yleftpointObstacle5_1])
  line([xleftpointObstacle4,xleftpointObstacle4],[8.667 yleftpointObstacle4])
  
 %obstacle 5
 line([xdownpoint5_1,xdownpoint5_1],[0,ydownpoint5_1])

 %up point
 %obstacle 3
 line([xuppoint3_1,xuppoint3_1],[yuppoint3_1,mapSize])
 
 %obstacle 4
 line([xuppoint4_1,xuppoint4_1],[yuppoint4_1,mapSize])
 line([xrightpointObstacle4_1,xrightpointObstacle4_1],[yrightpointObstacle4_1,mapSize])
 
 %obstacle 5
line([xleftpointObstacle5_1,xleftpointObstacle5_1],[yleftpointObstacle5_1,mapSize])
 
%%%end

%% create cell


cell_2=plot(xleftpointObstacle1,1/2*yleftpointObstacle1,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_1=plot(xleftpointObstacle1,yleftpointObstacle1+1/2*(mapSize-yleftpointObstacle1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_3=plot(xdownpoint1_1,1/2*ydownpoint1_1,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_4=plot(xdownpoint1_2,1/2*ydownpoint1_2,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_5=plot(xrightpointObstacle1,1/2*yrightpointObstacle1,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_6=plot(xrightpointObstacle1,yrightpointObstacle1+1/2*(mapSize-yrightpointObstacle1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_8=plot(xleftpointObstacle2,1/2*yleftpointObstacle2,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_7=plot(xleftpointObstacle2,yleftpointObstacle2+1/2*(mapSize-yleftpointObstacle2),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_9=plot(xdownpoint2_1,1/2*ydownpoint2_1,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_10=plot(xdownpoint2_2,1/2*ydownpoint2_2,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_11=plot(xdownpoint2_3,1/2*ydownpoint2_3,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_12=plot(xdownpoint2_4,1/2*ydownpoint2_4,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_13=plot(xrightpointObstacle2,1/2*yrightpointObstacle2,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_14=plot(xrightpointObstacle2,yrightpointObstacle2+1/2*(mapSize-yrightpointObstacle2),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_15=plot(xleftpointObstacle3,1/2*yleftpointObstacle3,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_16=plot(xleftpointObstacle3,yleftpointObstacle3+1/2*(mapSize-yleftpointObstacle3),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_17=plot(xuppoint3_1,yuppoint3_1+1/2*(mapSize-yuppoint3_1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_18=plot(xrightpointObstacle3,1/2*yrightpointObstacle3,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_19=plot(xrightpointObstacle3,yrightpointObstacle3+1/2*(12-yrightpointObstacle3),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_20=plot(xleftpointObstacle4,yleftpointObstacle4+1/2*(mapSize-yleftpointObstacle4),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_21=plot(xuppoint4_1,yuppoint4_1+1/2*(mapSize-yuppoint4_1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_22=plot(xrightpointObstacle4_1,yrightpointObstacle4_1+1/2*(mapSize-yrightpointObstacle4_1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_23=plot(xrightpointObstacle4,1/2*yrightpointObstacle4,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_24=plot(xrightpointObstacle4,yrightpointObstacle4+1/2*(mapSize-yrightpointObstacle4),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_25=plot(xleftpointObstacle5,1/2*yleftpointObstacle5,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_26=plot(xleftpointObstacle5,yleftpointObstacle5+1/2*(mapSize-yleftpointObstacle5),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_27=plot(xleftpointObstacle5_1,yleftpointObstacle5_1+1/2*(mapSize-yleftpointObstacle5_1),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_28=plot(xdownpoint5_1,1/2*ydownpoint5_1,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_29=plot(xrightpointObstacle5,1/2*yrightpointObstacle5,'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_30=plot(xrightpointObstacle5,yrightpointObstacle5+1/2*(mapSize-yrightpointObstacle5),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_31=plot(xrightpointObstacle4_1,16+1/2*(yrightpointObstacle4_1-16),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_32=plot(xleftpointObstacle5_1,18.5+1/2*(yleftpointObstacle5_1-18.5),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')
cell_33=plot(xleftpointObstacle4,8.667+1/2*(yleftpointObstacle4-8.667),'o','markersize',5,'markeredgecolor','k','markerfacecolor','y')



 %% probability roadmap

 xcell =[sp(:,1) xrightpointObstacle4_1 xleftpointObstacle5_1 xleftpointObstacle4 xleftpointObstacle1 xleftpointObstacle1 xdownpoint1_1 xdownpoint1_2 xrightpointObstacle1 xrightpointObstacle1 xleftpointObstacle2 xleftpointObstacle2 xdownpoint2_1 xdownpoint2_2 xdownpoint2_3 xdownpoint2_4 xrightpointObstacle2 xrightpointObstacle2 xleftpointObstacle3 xleftpointObstacle3 xuppoint3_1 xrightpointObstacle3 xrightpointObstacle3 xleftpointObstacle4 xuppoint4_1 xrightpointObstacle4_1 xrightpointObstacle4 xrightpointObstacle4 xleftpointObstacle5 xleftpointObstacle5 xleftpointObstacle5_1 xdownpoint5_1 xrightpointObstacle5 xrightpointObstacle5 gp(:,1)]
 
 ycell =[sp(:,2) 13.5+1/2*(yrightpointObstacle4_1-13.5) 18.5+1/2*(yleftpointObstacle5_1-18.5) 8.667+1/2*(yleftpointObstacle4-8.667) 1/2*yleftpointObstacle1 yleftpointObstacle1+1/2*(mapSize-yleftpointObstacle1) 1/2*ydownpoint1_1 1/2*ydownpoint1_2 1/2*yrightpointObstacle1 yrightpointObstacle1+1/2*(mapSize-yrightpointObstacle1) 1/2*yleftpointObstacle2 yleftpointObstacle2+1/2*(mapSize-yleftpointObstacle2) 1/2*ydownpoint2_1 1/2*ydownpoint2_2 1/2*ydownpoint2_3 1/2*ydownpoint2_4 1/2*yrightpointObstacle2 yrightpointObstacle2+1/2*(mapSize-yrightpointObstacle2) 1/2*yleftpointObstacle3 yleftpointObstacle3+1/2*(mapSize-yrightpointObstacle3) yuppoint3_1+1/2*(mapSize-yuppoint3_1) 1/2*yrightpointObstacle3 yrightpointObstacle3+1/2*(12-yrightpointObstacle3) yleftpointObstacle4+1/2*(mapSize-yleftpointObstacle4) yuppoint4_1+1/2*(mapSize-yuppoint4_1) yrightpointObstacle4_1+1/2*(mapSize-yrightpointObstacle4_1) 1/2*yrightpointObstacle4 yrightpointObstacle4+1/2*(mapSize-yrightpointObstacle4) 1/2*yleftpointObstacle5 yleftpointObstacle5+1/2*(mapSize-yleftpointObstacle5) yleftpointObstacle5_1+1/2*(mapSize-yleftpointObstacle5_1) 1/2*ydownpoint5_1 1/2*yrightpointObstacle5 yrightpointObstacle5+1/2*(mapSize-yrightpointObstacle5) gp(:,2)]
 
 %for i = 1:35
     %for j = 1:35
     %line([xcell(:,i),xcell(:,j)],[ycell(:,i),ycell(:,j)]);
    %end
 %end
 
 %% line k b
 syms x1 y1 x2 y2 x3 y3 x4 y4
m1=[xrightpointObstacle4 yrightpointObstacle4]
m2=[xrmidpoint4_1 yrmidpoint4_1]
n1=[x5(:,1) y5(:,1)]
n2=[x5(:,5) y5(:,5)]
p1=[xuppoint3_1 yuppoint3_1]
p2=[x4(:,1) y4(:,1)]
q1=[xrightpointObstacle4 yrightpointObstacle4]
q2=[xleftpointObstacle4 yleftpointObstacle4]

k1=(m2(:,2)-m1(:,2))/(m2(:,1)-m1(:,1))
k2=(n2(:,2)-n1(:,2))/(n2(:,1)-n1(:,1))
k3=(p2(:,2)-p1(:,2))/(p2(:,1)-p1(:,1))
k4=(q2(:,2)-q1(:,2))/(q2(:,1)-q1(:,1))

 
b1=m2(:,2)-k1*m2(:,1)
b2=n2(:,2)-k2*n2(:,1)
b3=p2(:,2)-k3*p2(:,1)
b4=q2(:,2)-k4*q2(:,1)

y1=k1*x1+b1
y2=k2*x2+b2
y3=k3*x3+b3
y4=k4*x4+b4
 

x4_H=[18 16]
x5_H=[x5(:,4) 18.5]
x3_H=[x4(:,1) 8.667]
x3_H_1=[xrightpointObstacle3 12.6]

%% create path and find the best one
% cell down path

xd=[sp(:,1) xleftpointObstacle1 xdownpoint1_1 xdownpoint1_2 xrightpointObstacle1 xleftpointObstacle2 xdownpoint2_1 xdownpoint2_2 xdownpoint2_3 xdownpoint2_4 xrightpointObstacle2 xleftpointObstacle3 xrightpointObstacle3 xrightpointObstacle4 xleftpointObstacle5 xdownpoint5_1 xrightpointObstacle5 gp(:,1)]
yd=[sp(:,2) 1/2*yleftpointObstacle1 1/2*ydownpoint1_1 1/2*ydownpoint1_2 1/2*yrightpointObstacle1 1/2*yleftpointObstacle2 1/2*ydownpoint2_1 1/2*ydownpoint2_2 1/2*ydownpoint2_3 1/2*ydownpoint2_4 1/2*yrightpointObstacle2 1/2*yleftpointObstacle3 1/2*yrightpointObstacle3 1/2*yrightpointObstacle4 1/2*yleftpointObstacle5 1/2*ydownpoint5_1 1/2*yrightpointObstacle5 gp(:,2)]

line([xd(:,1) xd(:,2) xd(:,3) xd(:,4) xd(:,5) xd(:,6) xd(:,7) xd(:,8) xd(:,9) xd(:,10) xd(:,11) xd(:,12) xd(:,13) xd(:,14) xd(:,15) xd(:,16) xd(:,17) xd(:,18)],[yd(:,1) yd(:,2) yd(:,3) yd(:,4) yd(:,5) yd(:,6) yd(:,7) yd(:,8) yd(:,9) yd(:,10) yd(:,11) yd(:,12) yd(:,13) yd(:,14) yd(:,15) yd(:,16) yd(:,17) yd(:,18)])

