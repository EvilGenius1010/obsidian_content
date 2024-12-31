- Real Time Communication over the web.
- Has sub second latency.
- For deeper knowledge, read https://webrtcforthecurious.com/
- It is a `peer-to-peer` protocol.

## HLS
- Has delays in order of tens of seconds.
- Stands for `HTTPS Live Streaming`.


# Signalling
- You do not need a server to send media from one person to another; but **you need a server to initially exchange data about the other device.**
- Once done, **you can kill the connection with the server** and the two peers can talk from one to another without the need of the signalling server.


# STUN(Session Traversal Utilities for NAT)
- A request is sent to the `STUN` Server for which it returns back a bunch of data about your machine which mostly includes the private `IP Address`.
- This is then sent to a signaling server and the other person also sends to the signaling server.
- These are hence exchanged, now the two peers can connect to each other by sending requests to the given IP Addresses.
- Why cannot we send a request to a server and it tries to figure out what address it needs to send the other person based on IP address of request?
	- Because full data isn't sent via requests, for example only public IP address is sent while making a request and no details about the private IP address are provided.


### ICE Candidates
- ICE (Interactive Connectivity Establishment) candidates are essentially potential network addresses that a device can use to communicate with another device.
- https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/ is a server to which we can send requests to and is a STUN server.
- Why are **Multiple ICE Candidates** returned?
	- If using one, we are unable to connect, we use a different candidate.




# Turn Server(Tradeoff)

- Sometimes the NAT restricts data being sent to the given IP.
- In such cases you specify a turn server as well with your ICE Candidates. 
- It is basically a **fallback mechanism** incase you cannot connect to a peer.
- In this case, data is routed through the turn server(intermediary server) and sent to the other person.


# Offer and Answer
- The initiation of the WebRTC connection is called an offer.
- The response to the `offer`  is called `Answer`.



## Important
- A single WebRTC connection is made usually.
- It means that if one person creates an Offer, the other accepts it, then **data can only be sent from the person who created the OFFER** .
- If we want data to be sent bidirectionally, then we create **two webRTC connections usually**.


# SDP(Session Description Protocol)

- SDP is actually sent to the signalling server, not the ICE Candidates.
- The ICE Candidates are present inside the SDP message.
- Answer received is also an SDP.
- Frames when being sent, aren't sent like 30 a second.
- Usually only the first is sent and then, the `diff` is sent afterward.




## Flow of Establishment of Connection
- Using `const rtc1=new RTCPeerConnection()`, we create a webRTC object.
- We create an offer using `const offer = rtc1.createOffer()` which creates an `SDP`.
- We set local Description to the offer created using `const lD = rtc1.setLocalDescription(offer)`.
- We send SDP to peer along with `ICE Candidates`.
- Using `const rtc2=new RTCPeerConnection()`, we create a webRTC object on second peer.
- We add received offer to the `remoteDescription` of this connection.
- We then send an `Answer` which is then set to `RemoteDescription` of `rtc1`.








#### F Moments

- Sender sends localDescription object as SDP to signalling server.
- answer sent is not answer itself but the remoteDescription set at receiver.