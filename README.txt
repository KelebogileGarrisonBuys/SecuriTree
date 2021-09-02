--OVERVIEW--

This security system is made up of the log in subsystem, the view hierarchy susbsystem, the manage doors subsystem.
The user is able to log in and out of the system. Once the user is logged in, they are able to view the 
entity hierarchy system, manage doors, view the log and log out the system.
The user can access these functions from the home screen of the system.
The user is able to lock or unlock doors with a click of a button on the manage doors screen.
The data is stored in MSSQL Server. The data is persistent throughout the system.
I hope the system is user-friendly and you will enjoy using it.

--INSTRUCTIONS--

1) Download and install Microsoft Visual Studio 2019 IDE. (Community is preffered)
2) Download and install Microsoft SQL Server 2008.
3) Download and install Microsoft Visual Studio Code.
4) Open SecuriTree.sql database file in MS SQL Server and execute it,found in the root folder SecuriTree. 
5) Open the SecuriTree.sln solution file in MS Visual Studio 2019 and go to Web.config file. Inside the file, replace the connection string for the database to the new 
    connection string to the database. Once this is done, run the solution found in the Backend folder
   (Green play button). Once it finished compiling, move to the next step.
6) Open the SecuriTree folder in MS Visual Studio Code and open the terminal in the directory of the folder, found in 
   the Frontend folder. In the terminal, run the program by typing "ng serve" in the terminal. Once it finished compiling,
   move to the next step.
7) Open a browser and in the URL section, type in "localhost:4200". This should open the system. Click the "Get data from
   File" button to automatically retrieve the JSON data stored on files.


