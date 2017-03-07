#ifndef DDEBUG
#define DDEBUG 0
#endif
#include "ddebug.h"


#include "ngx_http_lua_common.h"


int ngx_http_lua_ffi_bytes_sent(ngx_http_request_t *r)
{
    return r->connection->sent;
}

/* vi:set ft=c ts=4 sw=4 et fdm=marker: */
