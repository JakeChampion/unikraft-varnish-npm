vcl 4.1;

backend npm_registry {
    .host = "127.0.0.1";
    .port = "8443";
}

sub vcl_recv {
    set req.backend_hint = npm_registry;
    set req.http.Host = "registry.npmjs.org";
}