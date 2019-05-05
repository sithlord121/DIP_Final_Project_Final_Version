function[xp,yp] = snakeReparam4e(x,y)
%       Programmer: Manan Versin May 2018
%function [xp,yp] = snakeReparam4e(x,y) 
%   [XP,YP] = SNAKEREPARAM4E(X,Y) reparameterizes snake coordinates
%   [X,Y] by redistributing the points so that they are spaced
%   uniformly in terms of arc length. The number of points in the
%   output [XP,YP] is the same as in the input {X,Y]. It is
%   assumed that the snake is a closed planar curve.
num_points = length(x);
%size of x and y has to be same x and y are x-coordinate and y-coordinate
%of the points of the snake
p = interparc(num_points, x, y,'linear'); 
% Remember: In the book, (x, y) = (r, c) but interparc outputs
% values as (c, r);
xp = p(:,1); 
yp = p(:,2);

