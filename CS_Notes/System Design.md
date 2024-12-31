[[Netflix Piracy Prevention]]


## How TOTP Works

- Usually used for 2FA.
- At the start, you(client) and server basically agree on a same secret string. A hash is then generated based on the same every time step specified.
- This OTP is valid for this time step/duration. This is basically generated using a cryptographic hash.
- If both are same, this ensures integrity and thus is used for verification.