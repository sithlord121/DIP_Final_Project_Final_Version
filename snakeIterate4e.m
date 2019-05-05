function [xs, ys] = snakeIterate4e(alpha, beta, gamma, x, y, NI, Fx, Fy)
%function [xs,ys] = snakeIterate4e(alpha,beta,gamma,x,y,NI,Fx,Fy)
%   [XS,YS] = SNAKEITERATE4E(ALPHA,BETA,GAMMA,X,Y,NI,Fx,Fy)
%   computes the [XS,YS] coordinates of a segmentation snake using
%   the iterative solution in Eq.(11-46). Vectors X and Y are the
%   initial coordinates of the snake (provided in sequential order).
%   ALPHA, BETA, and GAMMA are as defined in Eq. (11-46) of DIP4E.
%   NI is the maximum allowed number of iterations, and Fx, Fy are
%   the force components used in Eq. (11-46). These are obtained
%   usually using function snakeForce4e.

np = length(x);

A = snakeA4e(np, alpha, beta);

x_iter = x;
y_iter = y;

[m,n] = size(Fx);

for iter = 1:NI
        
    for i = 1:np
        a = max(1, floor(x_iter(i)));    % using ceil(x) where x is close to an edge may cause a problem. I suggest "max(1,floor(x)).
        b = max(1, floor(y_iter(i)));
        xplus(i) = min(x_iter(i) + gamma * Fx(a, b), m); %added
        yplus(i) = min(y_iter(i) + gamma * Fy(a, b), n);  %added
    end
    
    xdash = A*xplus';
    ydash = A*yplus';
    
    plot(ydash, xdash, 'g');
    
    % reparameter every 1000 iterations
    if mod(iter, 1000) == 0
        [x_iter, y_iter] = snakeReparam4e(x, y);
    else
        x_iter = xdash;
        y_iter = ydash;
    end
    
xs = xdash;
ys = ydash;   

end