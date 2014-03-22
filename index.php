<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title>By The Public</title>

        <!--googlemap apis -->
        <script src="http://maps.google.com/maps/api/js?sensor=false"
        type="text/javascript"></script>
        <script src="js/keydragzoom.js" type="text/javascript"></script>
        <script src="js/btp.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/getvideos.js"></script>        

        <link rel="stylesheet" href="css/btp.css" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Hammersmith+One' rel='stylesheet' type='text/css'/>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/custom.css" rel="stylesheet"/>
        <script src="js/respond.js"></script>
    </head>
    <body onload="load()">
        <!--fb -->
        <div id="c1">  <!--what is this c1 for?  should delete it if no use-->
            <div class = "floaton"><h1 class="logo"> By The Public </h1></div>
            <div id="google-maps" class = "img-responsive">
                <div id="map"></div>
            </div>
        </div>


        <div class="side-bar showFilter">
            <div class="filter">
                <div class = "floaton">            
                    <button type="button" class="btn btn-xs btn-primary toggleButton pull-right" onclick="toggleFilter()">
                        <span class="glyphicon glyphicon-minus"></span>
                    </button>

                    <ul class = "nav nav-tabs" id ="top-nav">                        
                            <li class="active"><a href="#Start" data-toggle = "tab">Start</a></li>
                            <li><a href="#About" data-toggle = "tab">About</a></li>
                            <li><a href="#Signin" data-toggle = "tab">Signin</a></li>
                            <li><a href="#Hot" data-toggle = "tab">Hot</a></li>                       
                    </ul>
                    <div id = "filter-container">
                        <h2 class="logo">By The Public</h2> 
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id = "Start">
                                 <form class = "addressForm">
                                    <div class="row slider">
                                        <div class="col-xs-5">
                                            <label >Where to ?</label>
                                        </div>
                                        <div class="col-xs-4">
                                             <input id="address" type="text" class="form-control" placeholder="ZipCode"/>
                                        </div>
                                        <div class="col-xs-3">
                                            <button type="button" class = "btn btn-primary btn-small" value="Geocode" onclick="codeAddress()">
                                                <span class ="glyphicon glyphicon-search"></span>
                                            </button>
                                        </div>
                                    </div>
                                    <input id="btn1" type="button" value="Get Videos" hidden="true"/>

                                    <br/>
                                    <div class = "row slider" id="addrange">
                                        <div class="col-xs-5">
                                            <label>Mile Range</label>
                                        </div>
                                        <div class="col-xs-5">
                                            <input id="slide" type="range"   min="0" max="1000" step="5" value="500"  onchange="updateSlider(this.value, this.min, this.max)" />
                                        </div>
                                        <div class="co-xs-2"></div>                                                      
                                    </div>
                                    <div class="row slider">
                                        <div class="slider-row-align col-xs-4"> 
                                            <span id="chosen">500</span>
                                        </div>
                                        <div class="slider-row-align col-xs-1">
                                            <span>0</span>
                                        </div>
                                        <div class="slider-row-align col-xs-3"></div>
                                        <div class="slider-row-align col-xs-3">
                                            <span class="slider">1000</span>
                                        </div> 
                                    </div>
                               </form>
                            </div>
                         <!-- aBout -->
                         <div class="tab-pane fade" id = "About">
                            <div class="tabTextContainer">
                                <p>By-the-public is a blah blah blah</p>
                            </div>                             
                        </div>
                         <!-- SignIn -->
                         <div class="tab-pane fade" id = "Signin">
                            <form class="signForm form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-9">
                                      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                                    <div class="col-sm-9">
                                      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                      <div class="checkbox">
                                        <label>
                                          <input type="checkbox"> Remember me
                                        </label>
                                      </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                      <button type="submit" class="btn btn-default">Sign in</button>
                                    </div>
                                </div>
                            </form>                           
  
                         </div>               
                         <!-- Hot -->
                         <div class="tab-pane fade" id = "Hot">
                            <div class="tabTextContainer">
                                 <p>Top hot videos of the week</p>
                                 <p><a href="#" class="btn btn-info pull-right">View >></a></p>
                            </div>
                         </div>
                     </div>                  
                        
                    </div>           
                </div>
            </div>
        <!-- javascript -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>