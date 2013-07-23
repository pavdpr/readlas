function point = readLasPoint1( fid )
%READLASPOINT1 Summary of this function goes here
%   Detailed explanation goes here

point.x = fread( fid, 1, 'int32' );
point.y = fread( fid, 1, 'int32' );
point.z = fread( fid, 1, 'int32' );
point.intensity = fread( fid, 1, 'ushort' );
point.returnInfo = fread( fid, 1 );
point.classification = fread( fid, 1, 'uchar' );
point.scanAngleRank = fread( fid, 1, 'uchar' );
point.userData = fread( fid, 1, 'uchar' );
point.sourceId = fread( fid, 1, 'ushort' );
point.gpsTime = fread( fid, 1, 'double' );

end

