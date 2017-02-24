# Dockerized Dash Masternode

Version: 0.12.1

### Public Registry

https://hub.docker.com/r/tomasen/dash-masternode/

### Usage

start with you own dash.conf by simply running:

`docker run tomasen/dashd-masternode -v /root/.dashcore:/path-to-local-storage-that-contain-dash.conf`

or just save the time of writing any config file(eg. dash.conf) by running:

`docker run tomasen/dashd-masternode -v /root/.dashcore:/path-to-local-storage -e MN_PRIVATE_KEY=<masternode-privkey>`

There are four key environment variables:

| Name | Desc |     |
| ---- | ---- | --- |
| MN_PRIVATE_KEY | The private key of the masternode | Required |
| MN_EXTERNAL_IP | The external ip:port of this masternode | Optional |
| MN_RPCBIND     | Bind to given address to listen for JSON-RPC connections. Use [host]:port notation for IPv6. | Optional |
| MN_RPCALLOWIP  | To allow connections from other hosts | Optional |

WARNING: start docker container with above environment variables will overwrite existing dash.conf.

### Debug

you can use dash-cli to check running Masternode status, such as:

`docker exec <container_id_or_name_of_current_masternode> dash-cli mnsync status`

or

`docker exec <container_id_or_name_of_current_masternode> dash-cli masternode debug`

* * *
Donations are welcome at [XxkCgrET2pKXbF1eYyPxSqQvWpJQ6qYncG](https://chainz.cryptoid.info/drk/search.dws?q=XxkCgrET2pKXbF1eYyPxSqQvWpJQ6qYncG). Thanks
