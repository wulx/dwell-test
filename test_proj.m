%% TDD on proj
which proj

disp('ASSERT: projected width is zero when rotation angle is zero')
assert(proj(0) == 0)

disp('ASSERT: projected width equals to leaf width when rotation angle is pi/2')
assert(proj(pi/2, 60) == 60)

disp('ASSERT: projected width equals to half of leaf width when rotation angle is pi/6')
assert(roundn(proj(pi/6, 60), -5) == 30)

disp('TRY: rotation angle should be finite')
try
    proj(inf)
catch InfiniteExeption
    disp(['CATCH: ', InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'rotation angle should be finite'))
end

disp('ASSERT: projected widths equal to product of sin(rotAngles) and leaf width')
assert(isequal(proj(0:0.1:pi/2, 60), 60*sin(0:0.1:pi/2)))

disp('TRY: all rotation angles should be finite')
try
    proj([0 2 inf 1 pi/2 nan], 60)
catch InfiniteExeption
    disp(['CATCH: ', InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'rotation angle should be finite'))
end