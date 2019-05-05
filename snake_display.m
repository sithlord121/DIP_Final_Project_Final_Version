% Team 10: Allison Goins and Jesus Rodriguez%

function snake_display(x, y, style)
%  This function interpolates a snake over an image
%  x is a vector of x coordinates from mouse clicks
%  y is a vector of y coordinates from mouse clicks
%  style is a character string made from one element from any or
%  all the following 3 columns:
%
%            b     blue          .     point           -     solid
%            g     green         o     circle          :     dotted
%            r     red           x     x-mark          -.    dashdot 
%            c     cyan          +     plus            --    dashed   
%            m     magenta       *     star          (none)  no line
%            y     yellow        s     square
%            k     black         d     diamond
%            w     white         v     triangle (down)
%                                ^     triangle (up)
%                                <     triangle (left)
%                                >     triangle (right)
%                                p     pentagram
%                                h     hexagram
%                           
%
%   Thus, a symbol from the first column gives the color, the second
%   is the symbol used in the plot, and the third specifies the type
%   of line used to join the points in the plot. For example, to
%   plot red circles joined by straight lines we specify the string
%   'ro-'. To plot just red circles without any connecting lines we
%   specify the string 'ro'. The default MATLAB plot is black points
%   joined by black solid lines. The default for the present
%   function is black dots with no lines.
plot(y, x, style)
