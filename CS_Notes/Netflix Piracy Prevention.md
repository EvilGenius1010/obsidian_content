## Encryption

- It encrypts data and returns a key and an `IV(Initialisation Vector)` when using AES.
- Not very useful  as it basically prevents unauthorised access only.




## WideVine
https://docs.bunny.net/docs/widevine-drm-security-levels
https://developer.apple.com/streaming/fps/
- Shaka Player
- Max 720p watchable on Chrome.
	- Uses WideVine
- Max 4K on Safari.
		- It uses `Fairplay` , its own TEE, which is natively implemented on the Apple hardwareso even secure and performant hence 4k supported.

- Every device and playback session receives a unique encryption key.
- When a user attempts to play the encrypted content, their device sends a request to a Widevine license server.

### TEE (Trusted Execution Environment)
- The decryption is running on a secure environment on the hardware level.
- The keys are passed on to the TEE in built on the device. This makes it hard to intercept it.
- **Why Screen Recording Fails**

	- **Protected Video Memory:** The decrypted video is often stored in a protected memory area that is inaccessible to screen recording software.
	- **Real-time Encryption:** In some cases, the video may be decrypted and rendered in real-time, making it even harder to capture.
	- **DRM Enforcement:** The DRM system itself may actively monitor for screen recording attempts and take measures to prevent them, such as pausing the video or reducing its quality.

- ** TEEs ** are implemented at the hardware level, typically within a processor's chip.


If anyone wonders how Netflix, Prime, or any platform's videos are still pirated: 
1. Recording playback by tweaking the source code of the website, using certain extensions, or rooting Android devices to manipulate the "FLAG_SECURE" setting. However, this method results in low-quality video. 
2. Recording decrypted HDMI output using HDMI capture devices like Elgato, which can be connected between a media player and a display/TV to record the output. This method provides high-quality video, even up to 4K.
3. There are different security levels (L1, L2, L3) in Content Decryption Modules (CDMs), as mentioned in the video. L3 doesn't run in Trusted Execution Environments (TEE), making it easier to extract from Android devices. With this method, users can download playback content in up to 1080p or 720p.
4. For some Android devices, the TEE has been exploited, allowing L1 CDMs to be extracted. Pirates may purchase these exploited devices to obtain L1 CDMs, which are then used to download 4K-quality content.
5. It is believed that some people have reverse-engineered the Chrome CDM but have kept it secret. In the past, there have been instances of Chrome CDM being reverse-engineered. For example, you can search for "GitHub tomer007 reversing widevine" to find a write-up on how the Chrome CDM was reverse-engineered.
6. ![[Screenshot 2024-11-13 at 2.50.00 PM.png]]