Tarantula
---------

Mac OSX Bespin/Skywriter based editor (Desktop).
The idea is to enable Bespin access to native file-open/close commands, currently without
running a web-server inline. At the moment a JavaScript API is exposed to the Application.

How?
----

The Application folder of the project contains the actual Desktop-Web-Application, the index.html is automatically loaded.
A window.tarantula (or tarantula) object is exposed and allows for the following:

    tarantula.beep(); // Beeps - very exiting
    var result = tarantula.openPanel(); // Presents user with open dialog
    console.log(JSON.stringify(result));

    var menu = [
      {
        "title": "Tarantula",
        "items": [
          { "title": "About Tarantula", "keyEquivalent": "", "action": function() {} },
          { "title": "Quit Tarantula", "keyEquivalent": "q", "action": function() {} }
        ] 
      },
      {
        "title": "File",
        "items": [
          { "title": "New", "keyEquivalent": "n", "action": function() {} },
          { "title": "Open", "keyEquivalent": "o", "action": function() {} },
          { "title": "Close", "keyEquivalent": "w", "action": function() {} }
        ] 
      },
      {
        "title": "Help",
        "items": [
          { "title": "Tarantula Help", "keyEquivalent": "?", "action": function() {} },
        ] 
      }
    ];
    tarantula.setApplicationMenu(menu); // sets the application menu
    
Icon
----

I found the icon on http://mascot.crystalxp.net/en.id.20182-kavel-spider.html. 
It's licensed under Creative Commons BY-NC-ND and made by Kavel Inox (http://www.kavel-inox.com/).

Building
--------

Build using 10.6.4 and XCode 3.2.4.
Once the Debug/Release application is created copy the Application folder into the Tarantula.app/Contents/Resources folder.