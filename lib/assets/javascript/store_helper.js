function addLoadEvent(func) {
    oldload = window.onload;
    if (window.onload != 'function') {
        window.onload = func;
    } else {
        window.onload = function() {
            onload;
            func;
        }
    }
}


function foo() {
    $('section#new_products div.row div:eq(3)').after("<div class='w-100'></div><br>");
}

addLoadEvent(foo);