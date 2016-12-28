# vim:set ft= ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket::Lua;

#worker_connections(1014);
#master_process_enabled(1);
#log_level('warn');

repeat_each(2);

plan tests => repeat_each() * (blocks() * 4);

no_long_string();

run_tests();

__DATA__

=== TEST 1: arg[3] for size of body
--- config
    location = /test {
        content_by_lua_block {
            local val = string.rep("hello", 101)
            ngx.say(val)
            local val = string.rep("hello", 201)
            ngx.say(val)
        }
        body_filter_by_lua_block {
            ngx.log(ngx.ERR, "get data size: ", ngx.arg[3])
        }
    }
--- request
GET /test
--- error_log
get data size: 506
get data size: 1006
get data size: 0
