% Name    : snakeMap4e.m
% Authors : Alexander Garnica, Miika Raina

% Function  : snakeMap4e
% Arguments : F, T, SIG, NSIG, ORDER
function emap = snakeMap4e(f, varargin)

    % get args and create filter if not auto
    if nargin == 5
        [T, SIG, NSIG, ORDER] = deal(varargin{1:4});
        h = fspecial("gaussian", [SIG*NSIG SIG*NSIG], SIG);        
    elseif nargin == 2
        T = deal(varargin{1});
        ORDER = "none";
    else
        T = "none";
        ORDER = "none";
    end

    % image filter before
    if strcmp(ORDER, "before") || strcmp(ORDER, "both")
        fnew = imfilter(f, h);
        f=fnew;
        figure('Name','After filtering inside snakeMap4e'), imshow(emape);
    end
    
    % get edge map
    if isstring(T) && strcmp(T, "auto") % auto threshold
        emap = edge(f);
    elseif isstring(T) && strcmp(T, "none") % no threshold
        emap = imgradient(f);
        figure, imshow(emap)
        title('Gradient Magnitude (Left) and Gradient Direction (Right)')
    else % specific threshold
        emap = edge(f, "Sobel", T);
    end
    
    % edgemap filter after
    if strcmp(ORDER, "after") || strcmp(ORDER, "both")
        emap = imfilter(emap, h);
    end