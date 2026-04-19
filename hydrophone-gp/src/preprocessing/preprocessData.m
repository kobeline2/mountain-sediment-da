function Data = preprocessData(Data, Param)

if ~isfield(Param, "isused")
    Param.isused = 1:size(Data.C, 1);
end
Data.X = Data.C{Param.isused, Param.Xindex};
Data.y = Data.C{Param.isused, Param.yindex};
Data = rmfield(Data, "C");

end