%{
    myconv(x, y, p, s)
    Created by Ethan Shealey
    ============================================================
    myconv is a custom convolution function that takes in an
    input matrix, filter matrix, padding, and stride.

    Inputs:
        x: input matrix
        y: filter matrix
        p: padding value
        s: stride value

    Outputs:
	filtered: The new filtered matrix
%}

function filtered = myconv(x, y, p, s)
    % get sizes of both the input and the filter
    [nx, mx] = size(x); 
    [ny, my] = size(y);  
    
    % calc the size of the resulting matrix
    nf = floor((nx-ny+1)/s);
    mf = floor((mx-my+1)/s);

    % create the retun matrix filled with 0s
    filtered = zeros(nf, mf);
    
    % setup some variables
    rs = 1; % starting row
    re = ny; % ending row

    ir = 1; % insert row
    ic = 1; % insert col
    
    % iter through input matrix
    while re <= nx
        % setup the col start and end variables
        cs = 1;    
        ce = my;
        % for every col
        while ce <= mx
            % get the dot product and insert into filtered matrix
            filtered(ir, ic) = sum(dot(x(rs:re, cs:ce), y));
            ic = ic + 1;  
            % if at end of row, go to next row
            if ic > mf
                ir = ir + 1;
                ic = 1;
            end
            % move col by stride amount
            cs = cs + s;
            ce = ce + s;
        end   
        % move row by stride amount
        rs = rs + s;
        re = re + s;
    end
end
