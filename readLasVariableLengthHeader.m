function vlHeader = readLasVariableLengthHeader( fid )
%READLASVARIABLELENGTHHEADER Summary of this function goes here
%   Detailed explanation goes here

vlHeader.reserved = fread( fid, 1, 'ushort' );
vlHeader.userID = char( fread( fid, 16 )' );
vlHeader.recordID = fread( fid, 1, 'ushort' );
vlHeader.recordLengthAfterHeader = fread( fid, 1, 'ushort' );
vlHeader.description = char( fread( fid, 32 )' );

end

