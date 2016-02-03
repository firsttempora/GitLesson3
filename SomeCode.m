homedir = '/Users/Josh';
savepath = fullfile(homedir,'Documents','Saves',datestr(today,'yyyymmdd'));
loadpath = fullfile(homedir,'Documents','RawData','BlackMesa-Exp42');

remotedir = '/Volumes/share-sat/';
no2profiles = fullfile(remotedir,'SAT','BEHR','Monthly_NO2_Profiles');
globepath = fullfile(remotedir,'SAT','BEHR','GLOBE_Database');

F = dir(fullfile(loadpath,'*.mat'));
for a=1:numel(F)
    D=load(F(a).name);
    for p=1:numel(D.Pixels)
        lon = D.Pixels.Longitude;
        lat = D.Pixels.Latitude;
        D.Pixels.Terpres = get_globe_terpres(globepath, lon, lat);
    end
end
