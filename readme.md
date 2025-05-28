# varnish + stunnel unikraft example

To build and deploy to Unikraft Cloud run `./deploy.sh` it and will have this output:

```
[+] building rootfs via Dockerfile... done!                               x86_64 [1m 25s]
[+] packaging index.unikraft.io/netlify/find-most-downloaded-npm-kraftcloud/x86_64 [0.6s]
package-versions:latest... done!                                                         
[+] pushing... done!                                                       526 MB [21.3s]
+ varnishd -F -a :6081 -f /etc/varnish/default.vcl -T none
+ stunnel /etc/stunnel/stunnel.conf
stunnel: LOG5[ui]: stunnel 5.68 on x86_64-pc-linux-gnu platform
2025.05.28 09:42:19 LOG5[ui]: stunnel 5.68 on x86_64-pc-linux-gnu platform
stunnel: LOG5[ui]: Compiled with OpenSSL 3.0.9 30 May 2023
2025.05.28 09:42:19 LOG5[ui]: Compiled with OpenSSL 3.0.9 30 May 2023
stunnel: LOG5[ui]: Running  with OpenSSL 3.0.16 11 Feb 2025
2025.05.28 09:42:19 LOG5[ui]: Running  with OpenSSL 3.0.16 11 Feb 2025
stunnel: LOG5[ui]: Threading:PTHREAD Sockets:POLL,IPv6,SYSTEMD TLS:ENGINE,OCSP,PSK,SNI Auth:LIBWRAP
2025.05.28 09:42:19 LOG5[ui]: Threading:PTHREAD Sockets:POLL,IPv6,SYSTEMD TLS:ENGINE,OCSP,PSK,SNI Auth:LIBWRAP
stunnel: LOG5[ui]: Reading configuration from file /etc/stunnel/stunnel.conf
2025.05.28 09:42:19 LOG5[ui]: Reading configuration from file /etc/stunnel/stunnel.conf
stunnel: LOG5[ui]: UTF-8 byte order mark not detected
2025.05.28 09:42:19 LOG5[ui]: UTF-8 byte order mark not detected
stunnel: LOG5[ui]: FIPS mode disabled
2025.05.28 09:42:19 LOG5[ui]: FIPS mode disabled
stunnel: LOG5[ui]: Configuration successful
2025.05.28 09:42:20 LOG5[ui]: Configuration successful
Warnings:
VCL compiled.

Debug: Version: varnish-6.0.14 revision 66e26fc5b617b13f77f425a8e1674f43596b6f5f
Debug: Platform: Linux,6.5.13,x86_64,-junix,-sdefault,-sdefault,-hcritbit
Debug: Child (367) Started
Info: Child (367) said Child starts
```