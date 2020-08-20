# FIT5140-Demo-Code
Demo code for FIT5140 thursday morning class


## Week 3 - Delegate Protocol (Sending data back)
* Step 1: Create the Protocol that the viewcontroller needs to conform to.
* Step 2: Make the viewcontroller receiving the data, conform to the Protocol and implment the methods
* Step 3: Create a weak var in the viewcontroller of type protocol_name that will send the data back so that it can use the delegate method. Call the delegate method when it needs to send the data back.
* Step 4: In the receiving viewcontroller, before making the segue, make sure it is initalizing the delegate with itself

Note: If the code is not working as expected put break points and check the references and function calls.
