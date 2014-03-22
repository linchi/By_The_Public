var neighborhoods = [];
var markerHTML = [];
(function($) {	
	$(document).ready(function () {
            getVideos();
            //drop();
            function getVideos(){
                     $.getJSON('backEnd.php',function(data){
                         var tmpHTML;
                         for (var ii=0; ii<data.length; ii++) {   
                                           neighborhoods.push(new google.maps.LatLng(data[ii].lat,data[ii].lng));
                                           tmpHtml="<div class='video-frame'><h3 class='video-title'>"+data[ii].url+"<span class = 'pull-right glyphicon glyphicon glyphicon-star-empty'>Favorite</span></h3><span class='video-info'>Category: "+data[ii].category+"</span><span class='video-info'>Rating: "+data[ii].rating+"</span><span class='video-info'>Views: "+data[ii].views+"</span><div class='video-body'><video width=\"400\" height=\"240\" controls autoplay><source src=\""+data[ii].url+"\" type=\"video/mp4\">Your browser does not support the video tag.</video><div class='socialTeags'>FB stuff</div></div></div>";
                                           markerHTML.push(tmpHtml);
                                        }
                         drop();
                     });
            }
            $('#btn1').click(function(){
                    getYT();
                function getYT(){
                    $( '#iframeYT' ).attr( 'src', url);
                }
            });
    });
})(jQuery);