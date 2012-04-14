
function install() { 
  try {
    EvalCode(document);
  }
  catch(ex) {
    alert(ex);
  }
};
var oldload = document.onload;
document.onload = function() { if (oldload) oldload(); install; };
install();

function addNext(prev,element) {
  if (!element.tagName) element  = document.createElement(element);
  var next = prev.nextSibling;
  if (next) {
    prev.parentNode.insertBefore(element,next);
  }
  else {
    prev.parentNode.appendChild(element);
  }
  return element;
}


function EvalCode(doc) {
  FindCodeBlocks(doc).forEach(function(block) {
    var text = block.innerHTML.replace("&lt;","<").replace("&gt;",">").replace("&amp;","&");
    var a = addNext(block,"button");
    addNext(a,"hr");
    a.appendChild(doc.createTextNode(" Run this code ==> "));
    var resultel = addNext(a,"span");
    resultel.className='result';
    a.onclick = function() {
      while (resultel.hasChildNodes()) resultel.removeChild(resultel.lastChild);
      resultel.appendChild(EvalToNode(text));
    };
  });
}



function FindCodeBlocks(doc) {
  var l = doc.getElementsByTagName("pre");
  if (l.length < 1) return [];
  var a = [];
  for (var i = 0; i < l.length; i++) {
    a.push(l[i]);
  }
  return a;
};

function EvalToNode(text) {
  var el = document.createElement("code");
  try {
    var r = eval(text);
    el.className = 'good';
    el.appendChild(document.createTextNode(r));
  }
  catch (ex) {
    el.className = 'error';
    el.appendChild(document.createTextNode(ex));
  }
  return el;
}
