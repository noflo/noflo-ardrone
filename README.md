# noflo-ardrone [![Build Status](https://secure.travis-ci.org/noflo/noflo-ardrone.png?branch=master)](http://travis-ci.org/noflo/noflo-ardrone)

[Parrot AR.Drone 2.0](http://ardrone2.parrot.com/) components for NoFlo. You can utilize these components for building flow-based graphs to interact with your quadrocopter.

This library binds the excellent [Node.js ar-drone module](https://github.com/felixge/node-ar-drone) to the [Flow-Based Programming](http://noflojs.org/) world.

## Usage

In order to utilize these components, the computer where you're running your NoFlo flows must be connected to the WiFi network created by your AR.Drone. Create the flows you want to use to interact with your drone and then run them using the `noflo` command.

For example, to take off and land, you could utilize this flow as defined in the [fbp language](http://noflojs.org/documentation/fbp/):

``` fbp
# Start by connecting to drone. We could provide IP here
'' -> IP Connect(ardrone/Connect)

# Tell drone to take off
Connect() CLIENT -> CLIENT Takeoff(ardrone/Takeoff)
# Tell drone to land
Takeoff() CLIENT -> CLIENT Land(ardrone/Land)

# And that is all, folks!
Land() CLIENT -> IN End(core/Drop)
```

You can find more examples in <https://github.com/cannonerd/droning>.

## TODO

* Implement the rest of the motion commands as components
* Components for reading AR.Drone sensor output
