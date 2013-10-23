which step2rad

disp('ASSERT: no stepping so that radians is zero')
assert(step2rad(0, 1.8) == 0)

disp('ASSERT: one stepper corresponds to a step angle')
assert(step2rad(1, 1.8) == deg2rad(1.8))

disp('TRY: stepper numbers should be finite non-negative')
try
    disp('    SET: nSteps is inf')
    step2rad(inf);
catch InfiniteExeption
    disp(['CATCH: ' InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'stepper numbers should be finite non-negative'))
end

disp('TRY: stepper numbers should be finite non-negative')
try
    disp('    SET: nSteps is -2')
    step2rad(-2);
catch InfiniteExeption
    disp(['CATCH: ' InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'stepper numbers should be finite non-negative'))
end

disp('TRY: stepp angle should be finite non-negative')
try
    disp('    SET: stepAngleDeg is inf')
    step2rad(3, inf);
catch InfiniteExeption
    disp(['CATCH: ' InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'step angle should be finite non-negative'))
end

disp('TRY: stepp angle should be finite non-negative')
try
    disp('    SET: stepAngleDeg is -2')
    step2rad(3, -2);
catch InfiniteExeption
    disp(['CATCH: ' InfiniteExeption.message])
    assert(isequal(InfiniteExeption.message, 'step angle should be finite non-negative'))
end

disp('ASSERT: 2 stepper corresponds to double step angle')
assert(step2rad(2, 1.8) == deg2rad(2*1.8))

disp('ASSERT: step numbers as vector')
assert(isequal(step2rad(1:3, 1.8), deg2rad(1.8*(1:3))))

disp('ASSERT: step numbers as vector')
assert(isequal(step2rad([0 0 1], 1.8), deg2rad(1.8*[0 0 1])))

disp('ASSERT: step numbers as vector')
assert(isequal(step2rad([0 0 0 0], 1.8), deg2rad(1.8*[0 0 0 0])))
