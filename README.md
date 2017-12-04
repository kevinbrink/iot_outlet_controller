# IOT Outlet Controller

A (very simple) iOS app that performs post requests to a web server (see my [server repo](https://github.com/kevinbrink/iot_outlet_server)) for the purposes of controlling outlets via RF.

Done as a "Hack Week" project at Nav Canada.

The overall setup is something along the lines of this:

```
         http post request                        codesend             11754...
iOS App  ==================> iot_outlet_server =============> rfoutlet ========> physical RF transmitter module  ===> outlet on
[iPhone]                     [              Rasbperry Pi             ]
```
