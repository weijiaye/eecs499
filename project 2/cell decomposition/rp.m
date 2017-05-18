%% visibility roadmap


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


for i=1:33
    for j=1:33
        for n=1:6
            abc = 0;
            if X(1,n)==0
                break
            else
                x1=x_rmp(i)-X(1,n);
                y1=y_rmp(i)-Y(1,n);
                x2=x_rmp(j)-X(1,n);
                y2=y_rmp(j)-Y(1,n);
                m= n+1;
                if (m==7)||(X(1,m)==0)
                    x3=X(1,1)-X(1,n) ;y3=Y(1,1)-Y(1,n);
                else
                    x3=X(1,m)-X(1,n) ;y3=Y(1,m)-Y(1,n);
                end  
                a=x1*y3-x3*y1
                b=x3*y2-x2*y3
                 x4=X(1,n)-x_rmp(i);
                y4=Y(1,n)-y_rmp(i);
                if (m==7)||(X(1,m)==0)
                    x5=X(1,1)-x_rmp(i);
                    y5=Y(1,1)-y_rmp(i);
                else
                    x5 = X(1,m)-x_rmp(i);
                    y5=Y(1,m)-y_rmp(i);
                end
                x6=x_rmp(j)-x_rmp(i); y6=y_rmp(j)-y_rmp(i);
   
                a1=x4*y6-x6*y4
                b1=x6*y5-x5*y6
                if (a*b>0)&&(a1*b1>0)
                        abc = 1;
                        break
                end
            end
        end
        if abc == 0
            line([x_rmp(i),x_rmp(j)],[y_rmp(i),y_rmp(j)]);
        end
    end
end
                  


                     
              
                
                
                
                
                
                

















        