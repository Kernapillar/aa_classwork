
/*
refer to DOCS to understand and reference the methods, no need to memorize them

What is the DOM?
    - The Document is any webpage loaded in the bowser. This document serves as an enetry point into the web page's content, which is represented by the DOM

    - A reference to the document object exists as a property of the window (i.e. window.document)

    - DOM (Document Object Model) - a Web API Available for HTML, SVG< and XML documents
        -a llows programs to change the document structure, style, and content. 
        - The DOM represents the document using nodes and objects to represent the structure of our document (think family tree)

DOM Manipulation and JavaScript
    - DOM manipulation allows us to use plain JS to perform CRUD operations on the objects on our webpage. Any changes are reflected in the display of the document
    
    - Different browsers have different implementations of the DOM, with varying degrees of conformance to the W3C DOM standard, but they all use some Document Object Model to make web pages accessible via javascript

Data Types

    -Node - Every object located within a document is a node of some kind

    - Element - Refers to an element or a node of type element returned by a member of the DOM API

    -NodeList - a Node list is an array-like collection of nodes that can be accessed through indexing
        - can only call forEach on the NodeList, but you can do Array.from() to make other things an Array

    -HTMLCollection - an HTMLCollection is an array-like collection of elements

DOM Manipulation Methods

    .getElementById(idString) - Returns the HTML element of the given id

    .getElementsByClassName(classString) - Returns Collection of HTML elements with the given class

    .querySelectorAll(selector) - Returns first element of given selector   
    
    .querySelectorAll(selectors) - Returns a NodeList of matches
        - selectors can be tags(div), classes(.hidden), ids, and combined (h2#TOP > p)
        - not "live", does not update

DOM Styling Methods

    Inline

        - element.style.property="value" => inline sets property to a given value

            - div.style.display = "none";

            - p.style.fontWeight = "900";

    Class
    
        - element.classList => return array-like Object of classes for the element
        
        - element.classList.add(class) => add a class to given element

        - element.classList.remove(class) => removes class

Events and the DOM

    - An event can be something the browser does or something a user does

    -Examples:

        - a web page has finsiehd loading

        - an input field was changed

        -a button was clicked

    -JavaScript code can react to these events via event handlers or listeners installed on the DOM elements

Event Listeners

    - there are 3 ways to register event handlers for a DOM element
        
        - On an event target element using EventTarget.addEventListener()*
            -ideal best way, best practices

        - On a HTML attribute <button onclick="alert('Hello World!"> 
            - dont do this

        -DOM element properties myButton.onclick= function(event) {alert('Hello World!')}
            -less bad to do


 When using .addEventListener
    
    - change: An HTML element has been changed
 
    - click: The user clicks an HTML element
 
    - mouseover: user moves the mouse over an HTML element
 
    - mouseout: user moves the mouse away from an HTML element
 
    -  keydown: user pushes a keyboard key

    - load: An object has been loaded

Directly on an HTML element

    - onchange: ...
    - onclick: ...
    - onmouseover: ...
    - onmouseout: ...
    - onkeydown: ...
    - onload: ...

    same as above but not recomended, we want to have all the logic in JavaScript instead of HTML

Problem:

    - lets say we have a parent element with several child elements

    - lets also say something needs to happen when each child element is clicked

    - you could add a separate event listener to each individual child element, but what if they are frequently added/removed

    - adding/removing event listeners would suck shit

    - additionally event handlers can potentially cause memory leaks and performance degradation - the more you have the greater the risk


Delegation: "responsible parrents that take care of neglected children"

Solution: Bubbling and Event Delegation

    - Avoids adding event listeners to specific nodes, using the common parent instead

    - Bubbling Principle: after an event triggers on the deepest possible element, it then triggers on its parents in nesting order

    - The event listener analyzes bubbled events to find a match on child events

Target vs currentTarget

    1.event.target: A reference to the specific object where the event occured, this object "dispatched" the event (where the user clicked)

    1.Event.currentTarget: A reference to the element on which the event handler has been attached. (where the eventListener is located)



Web APIs

    - Web APIs are APIs for either a web server or a web browser

    - Web Apis rae typically only accessalble from the application's client-client side 


History 

    - The window.history read- only property returns a reference to the History object

    - the HIstory object provides an interface for the browser session history 

    - There is no way to clear the session history or disable the back and forth navigation from your code


History Methods

    -Moving backward and forward through user's history is done using window.history.back() and window.history.forward()

    - you can also use the window.history.go() method to load a page identified by 


Location

    - the window.location property returns a reference to the location object

Navigating with Location

    -To go to a page of all tehse are equivalent
        - window.location.assign(url);
        - window.location = url;
        - window.location.href = url
        - window.location.URL (READ ONLY

Anchor 
    - "#" comes at the end of the url
    - it looks ofr ids after the # anchor of the URL
    -if it doesnt find any then nothing happens







*/
