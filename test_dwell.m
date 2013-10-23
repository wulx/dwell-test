%% TDD for dwell
%
%% Units:
%* length -- mm
%* time -- s
%* velocity -- mm/s
%
%function test_dwell
% clean clear
clear all; close all; clc

disp('ASSERT: projected width is zero so that no dwell time')
assert(dwell(0) == 0)

disp(['ASSERT: dwell time equals the ratio of projected width and ',...
'translation velocity.'])
assert(dwell(60, 2) == 30)

disp('TRY: projected width should be finite non-negative')
try
    disp('	SET: projected width is negative')
    dwell(-1)
catch OutrangeExeption
    disp(['CATCH: ' OutrangeExeption.message])
end

disp('TRY: projected width should be finite non-negative')
try
    disp('	SET: projected width is infinite')
    dwell(inf)
catch OutrangeExeption
    disp(['CATCH: ' OutrangeExeption.message])
end

disp(['ASSERT: dwell time profile along substrate width is uniform',...
    'when the leaf does not rotate'])
assert( isequal(dwell(60,2,0:200), 30*ones(1,201)) )

disp(['EXPLORE: dwell time profile varies along substrate width ',...
    'when the leaf rotates half of a revolution'])
disp('projected width: 0 -> 60 -> 0')
part1 = linspace(0, 60, 1001);
projWidths = [part1 part1(end-1:-1:1)];
dwellTime = dwell(projWidths, 2, 0:200);
figure, plot(dwellTime, 'r.')

disp(['ASSERT: max dwell time should less than the ratio of max ',...
    'projcted width and translation velocity'])
assert(max(dwellTime) <= max(projWidths)/2)

disp(['EXPLORE: dwell time profile varies along substrate width ',...
    'when the leaf rotates half of a revolution with constant speed'])
disp('rotation angle: 0 -> pi/2 -> 0')
part1 = linspace(0, pi/2, 1001);
rotAngles = [part1 part1(end-1:-1:1)];
projWidths = proj(rotAngles, 60);
dwellTime = dwell(projWidths, 2, 0:200);
figure, plot(dwellTime, 'r.')
%end