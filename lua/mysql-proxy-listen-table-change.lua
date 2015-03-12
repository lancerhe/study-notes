function read_query( packet )
        if packet:byte() == proxy.COM_QUERY then
                if is_alter(packet) or is_create(packet) or is_drop(packet) then
                        proxy.queries:append(1, packet)
                        if  'test_' == get_dbname(packet):sub(1,5) then
                                return proxy.PROXY_SEND_QUERY
                        end
                        proxy.queries:append(2, string.char(proxy.COM_INIT_DB) .. 'notify', {resultset_is_needed = true} )

                        proxy.queries:append(2, string.char(proxy.COM_QUERY) .. "INSERT INTO `notify` (`db`, `query`, `datetime`) VALUES('".. get_dbname(packet) .."','".. get_query(packet) .."', '" .. get_datetime() .. "')", {resultset_is_needed = true} )
                        proxy.queries:append(2, string.char(proxy.COM_INIT_DB) .. get_dbname(packet), {resultset_is_needed = true} )

                        return proxy.PROXY_SEND_QUERY
                end
        end
end

function read_query_result(inj)
        if inj.id == 2 then
                return proxy.PROXY_IGNORE_RESULT
        end

        if  'test_' == get_dbname(inj.query):sub(1,5) then
                return
        end

        write_log(inj)
end

function get_datetime()
        return os.date("%Y-%m-%d %H:%M:%S", os.time())
end

function is_create(query)
        return "CREATE" == string.upper(query:sub(2, 7));
end

function is_drop(query)
        return "DROP" == string.upper(query:sub(2, 5));
end

function is_alter(query) 
        return "ALTER" == string.upper(query:sub(2, 6));
end

function get_dbname(query)
        if string.match(query, "`([A-Za-z0-9_]+)`%.") == nil then
                return string.lower(proxy.connection.client.default_db)
        else
                return string.lower(string.match(query, "`([A-Za-z0-9_]+)`%."))
        end
end

function get_query(query)
        return string.gsub(query:sub(2), "'", '"')
end

function build_notify(inj)
        return "Time: \n\t" .. get_datetime() .. "\nDatabase: \n\t" .. get_dbname(inj.query) .. "\nQuery: \n\t" .. get_query(inj.query) .. "\n"
end

function write_log(inj)
        local file = io.open("/var/log/mysql-proxy-alter", "a")
        file:write(build_notify(inj) .. "\n")
        file:close()
end
