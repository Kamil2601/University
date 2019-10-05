var dragged_color = ""

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(color) {
    dragged_color = color;
}

function drop(square) {
    document.getElementById(square).style.backgroundColor=dragged_color;
}
