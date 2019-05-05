trainImages = imageDatastore('U200.tif', 'IncludeSubfolders', true,...
    'LabelSource', 'foldernames');
numTrainImages = numel(trainImages.Labels);
idx = randperm(numTrainImages,1);
figure;
for i = 1:1
    subplot(1,1,i);
    f = readimage(trainImages,idx(i));
    if size(f, 3) == 3
        f = rgb2gray(f);
    end
    imshow(f);
end
np=150;
[x,y]=snake_manual_input(f,np,'ro:');
emape = snakeMap4e(f,"none",11,5,"before");
figure('Name','Edge Map'), imshow(emape);
[Fx,Fy]=gradient(emape);
% [Fx, Fy] = snakeForce4e(snakeMap4e(f), 'gradient');

figure, imshow(f);
hold on;
quiver(Fy,Fx);
hold off;

[Fx, Fy] = snakeForce4e(emape, 'gradient');

[xs, ys] = snakeIterate4e(.5, 0, 0.6, x, y, 20000, Fx, Fy); %0.7, 0.3, 0.6
figure, imshow(f);
hold on;
plot(ys, xs, 'g');
hold off;

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
        f = imfilter(f, h);
    end
    
    % get edge map
    if isstring(T) && strcmp(T, "auto") % auto threshold
        emap = edge(f);
    elseif isstring(T) && strcmp(T, "none") % no threshold
        emap = imgradient(f, "Sobel");
    else % specific threshold
        emap = edge(f, "Sobel", T);
    end
    
    % edgemap filter after
    if strcmp(ORDER, "after") || strcmp(ORDER, "both")
        emap = imfilter(emap, h);
    end  
end