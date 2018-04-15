function M = applycolor(grids, t)
% Function to return color movie visualization 

lengthGrids = t ;
disp(lengthGrids);
M = moviein(lengthGrids); % Number of frames of the movie is equal to the number of time-steps

m = size(grids, 1);
n = size(grids, 2);
disp('Size of the grid');
disp(m);
disp(n);

for k = 1:lengthGrids-1
    g = grids(:, :, k);
    image(g + 1)
    colormap(jet);
    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
    pause(0.001);
end