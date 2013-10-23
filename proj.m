function projWidth = proj(rotAngles, leafWidth)

if any(~isfinite(rotAngles))
    error('rotation angle should be finite')
end

if rotAngles == 0
    projWidth = 0;
else
    projWidth = sin(rotAngles) * leafWidth;
end

end