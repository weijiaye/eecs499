%filePath = fullfile(fileparts(which('PathPlanningExample')),'data','exampleMaps.mat');
%load(filePath)
map = robotics.BinaryOccupancyGrid(simpleMap,2);
show(map)