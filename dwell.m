%% dwell time algorithm
function dwellTime = dwell(projWidths, transVelocity, subScaleDivs)
if ~isscalar(projWidths)
    if any(~isfinite(projWidths) | projWidths<0)
        error('all projected widths should be finite non-negative.');
    end
    
    nProjWidths = numel(projWidths);
    
    margins = 0.5 * projWidths([1 end]);
    distance = subScaleDivs(end) - subScaleDivs(1) + sum(margins);
    
    totalTime = distance / transVelocity;
    timeline = linspace(0, totalTime, nProjWidths);
    
    firstPos = subScaleDivs(1) - margins(1);
    lastPos = subScaleDivs(end) + margins(2);
    leafCenterPos = linspace(firstPos, lastPos, nProjWidths);
    
    hitCounts = zeros(size(subScaleDivs));
    for i = 1:nProjWidths
        pos = leafCenterPos(i);
        halfWidth = 0.5*projWidths(i);
        proj = [pos-halfWidth, pos+halfWidth];
        count = subScaleDivs>proj(1) & subScaleDivs<=proj(2);
        hitCounts = hitCounts + count;
    end
    dwellTime = totalTime * hitCounts / (nProjWidths-1);
else
    if ~isfinite(projWidths) || projWidths<0
        error('projected width should be finite non-negative.');
    end
    
    if projWidths > 0
        dwellTime = projWidths / transVelocity;
    else
        dwellTime = 0;
    end
    
    if nargin>2
        dwellTime = dwellTime * ones(size(subScaleDivs));
    end
end

end