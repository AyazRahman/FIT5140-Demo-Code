# FIT5140-Demo-Code
Demo code for FIT5140 thursday morning class


## Week 3 - Delegate Protocol (Sending data back)
* Step 1: Create the Protocol that the viewcontroller needs to conform to.
* Step 2: Make the viewcontroller receiving the data, conform to the Protocol and implment the methods
* Step 3: Create a weak var in the viewcontroller of type protocol_name that will send the data back so that it can use the delegate method. Call the delegate method when it needs to send the data back.
* Step 4: In the receiving viewcontroller, before making the segue, make sure it is initalizing the delegate with itself

Note: If the code is not working as expected put break points and check the references and function calls.

## Week 4 - Core Data
* Step 1: Create add a new model file to your project (Make sure you are adding to the correct directory and group)
* Step 2: Add your entities and declare the attributes (Make sure to set the CodeGen as Manual/None)
* Step 3: Set relationships between your entities if any
* Step 4: With the model file selected, click on editor and create the NSManagedObject Subclass
* Step 5: Initialize a persistentContainer that can be accessed throughout your application.(PersistentContainer name should match the model file name)
* Step 6: Use the containers view context to access the CoreData(SQLite by default)
* Step 7: When the user is not using the app, save all the changes.
