%v = [4 5 2 8 4 7 2 64 2 57 2 45 7 43 2 5 7 3 3 6523 3 4 3 0 -65 -343];
v = [1, 2, 44, 102, -100, 4, 5, 10, 32];

% a) Remove all 2's from vector
%     - Get logical vector then index the original vector
vecA = v(v ~= 2);
disp(['A) ' num2str(vecA(:).')])

% b) Reverse vector
%     - Use Matlab's flip() function
vecB = flip(v);
disp(['B) ' num2str(vecB(:).')])

% c) Swap first and seconds halves of vector
%     - Calculate half the length and create a new vector using ranges
half = ceil(length(v)/2);
vecC = [v(half + 1: length(v)) v(1: half)];
disp(['C) ' num2str(vecC(:).')])

% d) Remove all values under 45
%     - A lot like a, get logical vector and index original
vecD = v(v < 45);
disp(['D) ' num2str(vecD(:).')])

% e) Get logical array for all items > 10
%     - A lot like a and d, but don't index original vector
vecE = v > 10;
disp(['E) ' num2str(vecE(:).')])
