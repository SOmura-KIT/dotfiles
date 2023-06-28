--[[
    * テーブルを値渡しによりコピーする
    * @param table テーブル
    * @return テーブルのコピー
]]
CopyTable = function(originTable)
    if IsNotTable(originTable) then
        error('argument is not table')
    end

    local copied = {}
    for key, value in pairs(originTable) do
        copied[key] = value
    end
    return copied
end

--[[
    * 引数がテーブルか判定
    * @param var 判定対象
    * @return varがテーブルならばtrue
]]
IsNotTable = function(var)
    return not type(var) == "table"
end

HasKey = function(tableObj, key)
    return tableObj[key] ~= nil
end
