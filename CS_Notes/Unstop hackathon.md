
## Components

- Google Oauth
- Email password
- Google Maps API
- Uber API


functionalities

1. icons
2. splash screen
3. loader
4. verification for ridesharing
5. constraints spe
6. distance and time specifier 

## landing page


1. find fastest route
2. find parking at location
3. Where you going
4. login with email,pwd

For Oauth
	1. https://medium.com/@tony.infisical/guide-to-using-oauth-2-0-to-access-google-apis-dead94d6866d
	2. https://www.blackduck.com/glossary/what-is-csrf.html
	3. https://developers.google.com/identity/protocols/oauth2


## Flow

1. API Integrations->MapsAPI->different modes of transport, 
	1. drive, taxi, metro, buses
	2. fuel consumptions for drivee
	3. costs for taxi.
	4. different UI for taxi and drive
2. Ridesharing


#### Estimating max requests which can be handled by system




#### Dump

- Added express-rate-limit
- created `.env.example`
- enable `-noUseLocal` flag in `tsconfig.json`
- Transferred commented code to new `.txt` file.
- Adapt `/otp` routes for authentication for ridesharing and other functionalities.
- need to rewrite history to remove `/dist` directory.
- remove `@turf/turf` -> geospatial toolkit
- removed `@turf` related code