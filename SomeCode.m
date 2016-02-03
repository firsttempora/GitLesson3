homedir = 'C:\Users\Josh';
savepath = fullfile(homedir,'My Documents','Saves',datestr(today,'yyyymmdd'));
loadpath = fullfile(homedir,'My Documents','RawData','BlackMesa-Exp42');

remotedir = 'Z:\';
no2profiles = fullfile(remotedir,'SAT','BEHR','Monthly_NO2_Profiles');
globepath = fullfile(remotedir,'SAT','BEHR','GLOBE_Database');

F = dir(fullfile(loadpath,'*.mat'));
for a=1:numel(F)
    D=load(fullfile(loadpath,F(a).name));
    for p=1:numel(D.Pixels)
        lon = D.Pixels(p).Longitude;
        lat = D.Pixels(p).Latitude;
        D.Pixels(p).Terpres = get_globe_terpres(globepath, lon, lat);
    end
end
