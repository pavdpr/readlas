function data = readLas( filename )
%READLAS Summary of this function goes here
%   Detailed explanation goes here

fid = fopen( filename, 'r' );
if fid < 0
    error( 'readLas:invalidFile', ...
        [ '"' filename '" is not a valid file' ] );
end

% read the public header
data.header = readLasPublicHeader( fid );

% initialize the list of variable length records
if data.header.numberOfVariableLengthRecords == 0
    data.vlr = [];
else
    data.vlr( data.header.numberOfVariableLengthRecords ) = [];
    % read the varible length records
    for i = 1:data.header.numberOfVariableLengthRecords
        data.vlr( i ) = readLasVariableLengthData( fid );
    end
end

% initialize the list of points
if data.header.numberOfPointRecords == 0
    data.point = [];
else
    switch data.header.pointDataFormatID
        % read the points.
        % the switch is outside the for loops to have fewer switch
        %   statements being used
        % the first point is put in the last element of the array to
        %   preallocate the array to the right size for efficency
        case 0
            data.point( data.header.numberOfPointRecords ) = ...
                readLasPoint0( fid );
            for i = 2:data.header.numberOfPointRecords
                data.point( i ) = readLasPoint0( fid );
            end
        case 1
            data.point( data.header.numberOfPointRecords ) = ...
                readLasPoint1( fid );
            for i = 2:data.header.numberOfPointRecords
                data.point( i ) = readLasPoint1( fid );
            end
        case 2 
            data.point( data.header.numberOfPointRecords ) = ...
                readLasPoint2( fid );
            for i = 2:data.header.numberOfPointRecords
                data.point( i ) = readLasPoint2( fid );
            end
        case 3
            data.point( data.header.numberOfPointRecords ) = ...
                readLasPoint3( fid );
            for i = 2:data.header.numberOfPointRecords
                data.point( i ) = readLasPoint3( fid );
            end
        otherwise
            error( 'readLas:invalidPointType', ...
                [ 'The point data format id "' ...
                num2str( data.header.pointDataFormatID ) ...
                '" is not currently supported' ] );
    
    end
    % reorder the points
    data.point = [ data.point( 2:end ) data.point( 1 ) ];
end

fclose( fid );
end

