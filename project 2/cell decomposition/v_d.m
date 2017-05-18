axis([0 30 0 30])
x=rand(10,1)*20;
y=rand(10,1)*20;
plot(x,y,'.')
hold on
voronoi(x,y)