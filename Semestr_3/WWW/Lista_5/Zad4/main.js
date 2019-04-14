var start_points = [[250,44],[10,450],[490,450]];


function print_points(n) {
    var c = document.getElementById("rect");
    var ctx = c.getContext("2d");

    ctx.clearRect(0, 0, c.width, c.height);
    ctx.moveTo(250, 44);
    ctx.lineTo(10, 450);
    ctx.lineTo(490, 450);
    ctx.lineTo(250, 44);
    ctx.stroke();
    var x0 = 250;
    var y0 = 44;
    for (i=0;i<n;i++){
        p = start_points[Math.floor(Math.random()*3)];
        var x1 = Math.floor((x0+p[0])/2);
        var y1 = Math.floor((y0+p[1])/2);
        //ctx.beginPath();
        //ctx.arc(x1,y1,1,0,2*Math.PI);
        ctx.fillRect(x1,y1,1,1);
        //ctx.stroke();
        x0=x1;
        y0=y1;
    }
}

function main(){
    var num = document.getElementById("number").value;
    print_points(num);
}