function table_merge(t1,t2)
	table.foreach(t2,function(k,v) table.insert(t1,v) end)
end