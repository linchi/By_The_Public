<?php
$link = mysql_connect('localhost', 'root', '');

if (!$link) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db('bythepublic');
$result = mysql_query('SELECT post_id,lat,lng,url,time,category,Avg_rating,view_count from POST');
if($result === FALSE) {
    die(mysql_error()); // TODO: better error handling
}
$jsonData = array();
while ($array = mysql_fetch_row($result)) {
        $arr = array('id' => $array[0], 'lat' => $array[1], 'lng' => $array[2],'url' => $array[3], 'timeline' => $array[4], 'category'=> $array[5], 'rating'=>$array[6], 'views'=>$array[7]);
        $jsonData[] = $arr;
}
mysql_close($link);
echo json_encode($jsonData);
//echo 'Connected successfully';

?>