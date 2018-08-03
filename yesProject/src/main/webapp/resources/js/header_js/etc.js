function markerImageList() {
    for (i = 0; i<50; i++){
        $('.markerImageListDiv').append('<img class="foodIcon'+i+' markerIcon" src="/imgs/markerIcon/foodIcon'+i+'.png" width="57" height="57" />');
    }

}



var loadFile = function(event) {
    var tempmsg = event.target.id.slice(10,11);
    var outputs = 'output'+tempmsg;
    var output = document.getElementById(outputs);
    output.src = URL.createObjectURL(event.target.files[0]);
};