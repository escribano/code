###

Path to Node

Node parameters
  In this text box, type the NodeJS-specific command line options to be passed to 
  the NodeJS executable file. The acceptable options are:
  
  --debug==<port for connect to debugger remotely>  
    Specify this option to enable remote debugging of the application 
    without re-starting the NodeJS server.
  
  -v, --version
    Print the current version of NodeJS.
  
  -e, --eval script
    Evaluate script.
  
  --v8-options
    Print v8 command line options.
  
  --vars
    Print various compiled-in variables.
  
  --max-stack-size=val
    Set max v8 stack size (bytes).
  
Path to Node App JS file
  In this field, specify the full path to the NodeJS file to start running or debugging from.
  
Application parameters
  In this text box, type the NodeJS-specific arguments to be passed to the 
  starting NodeJS application file through the process.argv array.
  
Working directory
  In this field, specify the location of the files referenced from the starting 
  NodeJS application file, for example, includes. If this file does not reference any 
  other files, just leave the field empty. Choose the folder from the drop-down list, 
  or type the path manually, or click the Browse button  and select the location in 
  the dialog box, that opens.
  
Environment variables
  In this field, specify the environment variables for the NodeJS executable file, 
  if applicable. Click the Browse button  to the right of the field and configure a list of 
  variables in the Environment Variables dialog box, that opens:
  
    To define a new variable, click the Add toolbar button  and specify the variable name and value.
    To discard a variable definition, select it in the list and click the Delete toolbar button .
    Click OK, when ready
    
  The definitions of variables are displayed in the Environment variables 
  read-only field with semicolons as separators. The acceptable variables are:

    NODE_PATH
      A :-separated list of directories prefixed to the module search path.
    NODE_MODULE_CONTEXTS
      Set to 1 to load modules in their own global contexts.
    NODE_DISABLE_COLORS
      Set to 1 to disable colors in the REPL.
      
Run with CoffeeScript plugin
  If this check box is selected, you can launch the CoffeeScript files directly, 
  bypassing their conversion to JavaScript.
  
Path to coffee executable
  Specify here the path to the executable file that launches CoffeeScript.
  
CoffeeScript parameters
  Specify here the parameters to be passed to CoffeeScript.
  
###