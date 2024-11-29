#!/bin/sh

# Start the Podman system service in the background
podman system service -t 0 &

# Start the Nomad agent
nomad agent -dev -config=/etc/nomad.d/nomad.hcl