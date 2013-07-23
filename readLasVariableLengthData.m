function vlData = readLasVariableLengthData( fid )
%READLASVARIABLELENGTHDATA Summary of this function goes here
%   Detailed explanation goes here

% read the header
vlData.header = readLasVariableLengthHeader( fid );

% read the data
vlData.data = fread( fid, vlData.header.recordLengthAfterHeader );

end

