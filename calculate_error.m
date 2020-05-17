% calculates percentage of bad pixels
% (pixels, with error larger than unity)
% 
% Syntax: [err] = calculate_error(Disp, GT)
% Disp - disparity map
% GT - ground truth to be compared against
% occlusions - pixels which are ignored from the error computation


function [err] = calculate_error(Disp, GT, occlusions)
    err = 0;
    for y = 1:size(Disp,1)
        for x = 1:size(Disp,2)
            if (abs(Disp(y,x) - GT(y,x))) > 1
                err = err + 1;
            end
        end
    end
    err = err/numel(Disp);
end