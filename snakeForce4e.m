%Group 6: Brittany Mooney and Martin Sanchez
%Project Phase 3: function snakeForce

function [Fx,Fy] = snakeForce4e(emap,mode) 
%function [Fx,Fy] = snakeForce4e(emap, mode, mu, niter)
%mode doesn't require MU or NITER right now.
%additional mode: 'gvf' will use MU and NITER

    if mode == "gradient"
    [Fx,Fy] = gradient(double(emap));
    end
end
