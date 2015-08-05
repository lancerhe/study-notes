```javascript
function getMeta(varA, varB) {
    if (typeof varB !== 'undefined') {
       alert(varA + ' width ' + varB + ' height');
    } else {
       var img = new Image();
       img.src = varA;
       img.onload = function() {
           getMeta(this.width, this.height);
       }
    }
}
 
getMeta("http://snook.ca/files/mootools_83_snookca.png");

```