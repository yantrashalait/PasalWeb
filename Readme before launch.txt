This Folder contains - System project folder, sql-file and required image file.

Please remember to go to application.properties file to change:
	1. Database settings
	2. Enter the Email and Password for email-sending.
		(NOTE: if unable to send due to restrictions from google, need to go 		to your google setting and Turn on Less secure app success )
		Also: this problem won't arise when deployed in https access domain, 		but occurred when deployed in localhost.
	3. For Twilio SMS features: 
		Open OTPSystemRestController.java file under controller package and 		enter your twilio ACCOUNT_SID and AUTH_ID. 
		ALSO, Enter your Twilio Phone-number where it is specified in code.
	4. Be sure to import the database "Pasal.sql".
	5. Open ResourceConfig.java file under config package, and edit the 			location to your access location.