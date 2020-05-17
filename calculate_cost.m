% calculates cost volume out of two images
% Syntax: [CostL, CostR] = calculate_cost(L, R, maxdisp);
%
% Where:
% CostL - Cost volume assocuiated with Left image
% CostR - Cost volume assocuiated with Right image
% L, R - Left and Right input images
% mindisp, maxdisp - parameters, limiting disparity 
%
% Algorithm hints:
% for disp from 0 to maxdisp
%   CostL(y,x,disp) = |L(y,x,:)-R(y,x-disp,:)| 
%   CostR(y,x,disp) = |R(y,x,:)-L(y,x+disp,:)| 


function [CostL, CostR] = calculate_cost(L, R, maxdisp)
    L = double(L);
    R = double(R);
    CostL = ones(size(L,1),size(L,2),maxdisp+1) * inf;
    CostR = ones(size(R,1),size(R,2),maxdisp+1) * inf;
    for disp = 0:maxdisp
        for y = 1:size(L,1)
            for x = 1+disp:size(L,2)
                CostL(y,x,disp+1) = abs(L(y,x,1)-R(y,x-disp,1)) + abs(L(y,x,2)-R(y,x-disp,2)) + abs(L(y,x,3)-R(y,x-disp,3));
                if CostL(y,x,disp+1) > 150
                    CostL(y,x,disp+1) = 150;
                end
            end
            for x = 1:size(L,2)-disp
                CostR(y,x,disp+1) = abs(R(y,x,1)-L(y,x+disp,1)) + abs(R(y,x,2)-L(y,x+disp,2)) + abs(R(y,x,3)-L(y,x+disp,3));
                if CostR(y,x,disp+1) > 150
                    CostR(y,x,disp+1) = 150;
                end
            end
        end
    end
end
