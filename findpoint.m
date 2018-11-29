function [ out_x,out_y ] = findpoint ( in_lon, in_lat, nlon, nlat )
%   [ out_x,out_y ] = findpoint ( in_lon, in_lat, nlon, nlat )
%   in_lon: longitude of the station
%   in_lat: latitude of the station
%   nlon: longitude of the model domain (2D Var)
%   nlat: latitude of the model domain (2D Var)
%   out_x: the nearest position of the station in the model domain in x
%   direction
%   out_y: the nearest position of the station in the model domain in y
%   deiection

[xnum,ynum]=size(nlon);
gridnum=xnum*ynum;

nlon=reshape(nlon,gridnum,1);
nlat=reshape(nlat,gridnum,1);

out_x=nan;
out_y=nan;

[~,index]=min((nlon-in_lon).^2+(nlat-in_lat).^2);
out_y=ceil(index/xnum);
out_x=index-xnum*(out_y-1);

