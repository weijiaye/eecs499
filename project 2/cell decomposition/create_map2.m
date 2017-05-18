
    
    % Plot vertical lines
    for i=0:mapSize,
        % Plot line
        plot([i i], [0 mapSize], 'Color', 'black');
        hold on;
        plot([0 mapSize], [i i], 'Color', 'black');
        hold on;
    end
    
    % Fill every point as white
    for i=1:mapSize,
        for j=1:mapSize,
            % Plot the point
            tempX = [i-1; i; i; i-1];
            tempY = [j-1; j-1; j; j];
            tempH = fill(tempX, tempY, 'w');
            hold on;
            handleMatrix(i,j) = tempH;
        end
    end
    
    % Set axis
    axis([0 mapSize 0 mapSize]);
    hold on;
        patch([2 3 4 5 ],[7 7 4 10 ],[0 0 0]); 
        patch([7 8 9 10 11 6],[14 16 17 15 19 21],[0 0 0]);
        patch([12 13 16 ],[6 12 7],[0 0 0]);
        patch([15 17 19 18 20],[12 16 16 15 12],[0 0 0]); 
        patch([21 25 26 22 23],[17 19 22 22 20],[0 0 0]);

