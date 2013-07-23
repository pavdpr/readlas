function header = readLasPublicHeader( fid )
%READLASPUBLICHEADER Summary of this function goes here
%   Detailed explanation goes here

header.fileSignature = char( fread( fid, 4 )' );
header.fileSourceID = fread( fid, 1, 'ushort' );
header.globalEncoding = fread( fid, 1, 'ushort' );
header.projectID1 = fread( fid, 1, 'uint32' );
header.projectID2 = fread( fid, 1, 'ushort' );
header.projectID3 = fread( fid, 1, 'ushort' );
header.projectID4 = char( fread( fid, 8 )' );
header.versionMajor = fread( fid, 1 );
header.versionMinor = fread( fid, 1 );
header.systemIdentifier = char( fread( fid, 32 )' );
header.generatingSoftware = char( fread( fid, 32 )' );
header.fileCreationDayOfYear = fread( fid, 1, 'ushort' );
header.fileCreationYear = fread( fid, 1, 'ushort' );
header.headerSize = fread( fid, 1, 'ushort' );
header.offsetToPointData = fread( fid, 1, 'uint32' );
header.numberOfVariableLengthRecords = fread( fid, 1, 'uint32' );
header.pointDataFormatID = fread( fid, 1, 'uchar' );
header.pointDataRecordLength = fread( fid, 1, 'ushort' );
header.numberOfPointRecords = fread( fid, 1, 'uint32' );
header.numberOfPointsByReturn = fread( fid, 5, 'uint32' )';
header.xScaleFactor = fread( fid, 1, 'double' );
header.yScaleFactor = fread( fid, 1, 'double' );
header.zScaleFactor = fread( fid, 1, 'double' );
header.xOffset = fread( fid, 1, 'double' );
header.yOffset = fread( fid, 1, 'double' );
header.zOffset = fread( fid, 1, 'double' );
header.maxX = fread( fid, 1, 'double' );
header.minX = fread( fid, 1, 'double' );
header.maxY = fread( fid, 1, 'double' );
header.minY = fread( fid, 1, 'double' );
header.maxZ = fread( fid, 1, 'double' );
header.minZ = fread( fid, 1, 'double' );


end

