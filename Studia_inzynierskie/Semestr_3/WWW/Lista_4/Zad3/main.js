var big_now = true;
var started = false;

var n = 9;
var squares_left = n;
var time = 0;
touched = new Array();
results = new Array();

function show_time()
{
    
    time++;
    mins = Math.floor(time/60);
    sec = time%60;
    if (sec<10) sec = "0"+sec;
    document.getElementById("timer").innerHTML=mins+":"+sec;
    if (started==true)
        setTimeout("show_time()",1000)
}

function refresh(){
    for (i=1;i<=n;i++)
    {
        touched[i-1]=false;
        document.getElementById("s"+i).style.backgroundColor="green";
    }
    time = 0;
    document.getElementById("timer").innerHTML="00:00";
    squares_left = n;    
    started = false;
    big_now = true;
    document.getElementById("big").style.backgroundColor="orange";
    document.getElementById("timer").innerHTML="00:00";
}

function load_board(){
    refresh();
    
    used_fields = new Array();
    for (i=0; i<12; i++)
    {
        used_fields[i] = [false,false,false,false,false,false,false,false,false,false,false,false]
    }
    for (i=4; i<=7; i++)
    {
        for (j=4; j<8; j++)
        {
            used_fields[i][j]=true;
        }
    }
    for (i=1; i<=n; i++)
    {
        x = Math.floor(Math.random() * 12)
        y = Math.floor(Math.random() * 12)
        while (used_fields[y][x]==true)
        {
            x = Math.floor(Math.random() * 12)
            y = Math.floor(Math.random() * 12)
        }
        used_fields[y][x]=true;
        square = document.getElementById("s"+i);
        square.style.top = (22+50*y)+"px";
        square.style.left = (302+50*x)+"px";
    }

}

function show_results(){
    res_string = "Wyniki:" + "\n"
    for (i=0; i<results.length;i++)
    {
        minutes = Math.floor(results[i]/60);
        if (minutes<10) minutes = "0"+minutes;
        seconds = Math.floor(results[i]%60);
        if (seconds<10) seconds = "0"+seconds;
        res_string += "\n"+minutes+":"+seconds+"\n";
    }

    document.getElementById("res").innerHTML=res_string;
}

function touch_big(){
    if (big_now)
    {
        document.getElementById("big").style.backgroundColor="blue";
        big_now=false;
        if (started == false)
        {
            started=true;
            show_time();
        }
        if (squares_left == 0)
        {
            if (started==true){
                results.push(time);
                show_results();
                load_board();
            }
        }
    }
    
    
}

function touch_small(id){
    if (big_now==false)
    {   
        square = document.getElementById(id);
        if (touched[id[1]-1]==false)
        {
            square.style.backgroundColor="red";
            document.getElementById("big").style.backgroundColor="orange";
            big_now=true;
            squares_left--;
            
        }
    }
    if (touched[id[1]-1])
    {
        time+=5;
    }
}

function leave(id){
    if (document.getElementById(id).style.backgroundColor=="red")
        touched[id[1]-1]=true;
}
