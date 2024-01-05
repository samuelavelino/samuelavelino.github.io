/*
function attachEvent(element, event, callbackFunction) {
    if (element.addEventListener) {
        element.addEventListener(event, callbackFunction, false);
    } else if (element.attachEvent) {
        element.attachEvent('on' + event, callbackFunction);
    }
}
function addEventListener(obj,evt,func){
    if ('addEventListener' in window){
        obj.addEventListener(evt,func, false);
    } else if ('attachEvent' in window){//IE
        obj.attachEvent('on'+evt,func);
    }
}
//https://stackoverflow.com/questions/6927637/addeventlistener-in-internet-explorer
function addEvent(evnt, elem, func) {
   if (elem.addEventListener)  // W3C DOM
      elem.addEventListener(evnt,func,false);
   else if (elem.attachEvent) { // IE DOM
      elem.attachEvent("on"+evnt, func);
   }
   else { // No much to do
      elem["on"+evnt] = func;
   }
}
["load", "resize"].forEach(function (evt) {
    addEventListener(window, evt, update());
});
*/

// Chama a função quando a página carrega e quando a janela é redimensionada
/*
window.addEventListener('resize', update);
window.addEventListener('load', update);
window.addEventListener('orientationchange', function() {
  location.reload();
});
*/

["load", "resize", "orientationchange"].forEach(function (evt) {
    window.addEventListener(evt, function() {
        update();
        //location.reload();
    });
});

/*
["load", "resize"].forEach(function (evt) {
    window.addEventListener(evt, update);
});
*/
    
function ExibirInformacoes() {

// Pegar a altura e largura da div .contend
var container = document.querySelector('.container');
// se colocar o content nao vai alinhar por causa do overflow: overlay
var largura = container.clientWidth;
var altura = container.clientHeight;

    var panel = document.querySelector('.panel');

    var panellargura = panel.clientWidth;
    console.log("panellargura: " + panellargura);

    var margin = (largura - panellargura) / 2;
    console.log("margin: " + margin);
    
    //console.log("Largura: " + largura);

    const element = document.querySelector('.content');
    console.log("Largura: " + element.offsetWidth + "px");
    console.log("Altura: " + element.offsetHeight + "px");

    const element2 = document.querySelector('.content');
    const rect = element2.getBoundingClientRect();
    console.log("Width: " + rect.width + "px");
    console.log("Height: " + rect.height + "px");
}

function update() {

// Pegar a altura e largura da div .contend
var container = document.querySelector('.container');
// se colocar o content nao vai alinhar por causa do overflow: overlay
var largura = container.clientWidth;
var altura = container.clientHeight;

    const panels = document.querySelectorAll('.panel');

    panels.forEach(panel => {
        // Verificar se a largura é maior que a altura
        if (largura > altura) {
          
          panel.style.width = '60vw';
          
        }
        else {
          
          panel.style.width = '85vw';
          
        }
        
        //console.log(panel.offsetLeft);
        var panellargura = panel.clientWidth;

        var margin = (largura - panellargura) / 2;
        //margin = margin + (getScrollBarWidth()/2);

        //panel.style.width = '68vw';
        panel.style.margin = '5vh ' + margin + 'px'; //margin + 'px auto';

    });
    
    ExibirInformacoes();
}
    
        
