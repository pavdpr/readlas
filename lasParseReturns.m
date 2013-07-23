function [ returnNumber, numberOfReturns, scanDirectionFlag, edgeOfFlightLine ] = lasParseReturns( returnInfo )
%LASPARSERETURNS Summary of this function goes here
%   Detailed explanation goes here

returnInfo = uint8( returnInfo );

returnNumber = bitand( returnInfo, 7 );
numberOfReturns = bitshift( bitand( returnInfo, 56 ), -3 );
scanDirectionFlag = logical( bitshift( bitand( returnInfo, 64 ), -6 ) );
edgeOfFlightLine = logical( bitshift( bitand( returnInfo, 128 ), -7 ) );

end

