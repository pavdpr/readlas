function header = readLasHeader( filename )
%READLAS Summary of this function goes here
%   Detailed explanation goes here

fid = fopen( filename, 'r' );
if fid < 0
    error( 'readLasHeader:invalidFile', ...
        [ '"' filename '" is not a valid file' ] );
end

% read the public header
header = readLasPublicHeader( fid );

fclose( fid );

end