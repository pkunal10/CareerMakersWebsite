<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="User_Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery</title>

    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/skingreen.css" />
    <!-- change skin color here -->
    <link rel="stylesheet" type="text/css" href="css/responsive.css" />
    <script src="js/jquery-1.9.0.min.js"></script>

</head>
<body>
    <form runat="server">
        <div class="grid">
            <div class="row space-bot">
                <!--Logo-->
                <div class="c4">
                    <a href="index.html">
                        <img src="images/ConsultancyLogo.png" class="logo" alt="">
                    </a>
                </div>
                <!--Menu-->
                <div class="c8">
                    <nav id="topNav">
                        <ul id="responsivemenu">
                            <li class=""><a href="Home.aspx"><i class="icon-home homeicon"></i><span class="showmobile">Home</span></a></li>
                            <li><a href="#">Admission</a>
                                <ul style="display: none;">
                                    <asp:Repeater ID="AdmissionCategoryRptr" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton ID="admissionCatLb" runat="server" CommandArgument='<%#Eval("id") %>' OnCommand="admissionCatLb_Command"><%#Eval("Category") %></asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </li>
                            <li><a href="#">Job Offer</a>
                                <ul style="display: none;">
                                    <asp:Repeater ID="JobOfferCategoryRptr" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton ID="jobOfferCatLb" runat="server" CommandArgument='<%#Eval("id") %>' OnCommand="jobOfferCatLb_Command"><%#Eval("Category") %></asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>
                            </li>
                            <li>
                                <a href="Gallery.aspx">Gallery</a>
                            </li>
                            <li>
                                <a href="AdmissionForm.aspx">Admission Form</a>
                            </li>
                            <%--<li><a href="#">Portfolio</a>
                                <ul>
                                    <li><a href="portfolio2.html">Two Columns</a></li>
                                    <li><a href="portfolio3.html">Three Columns</a></li>
                                    <li><a href="portfolio4.html">Four Columns</a></li>
                                    <li><a href="portfolio5.html">Five Columns</a></li>
                                    <li><a href="portfolio-masonry3.html">Three Masonry</a></li>
                                    <li><a href="portfolio-masonry4.html">Four Masonry</a></li>
                                    <li><a href="portfolio-masonry5.html">Five Masonry</a></li>
                                    <li><a href="singleproject.html">Project Details</a></li>
                                </ul>
                            </li>--%>
                            <li class="last"><a href="ContactUs.aspx">Contact</a></li>

                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- HEADER
================================================== -->
        <div class="undermenuarea">
            <div class="boxedshadow">
            </div>
            <div class="grid">
                <div class="row">
                    <div class="c8">
                        <h1 class="titlehead">Gallery</h1>
                    </div>
                    <div class="c4">
                        <h1 class="titlehead rightareaheader"><i class="icon-map-marker"></i>Call Us Now +91 7006305281</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT
================================================== -->
        <div class="grid">
            <div class="shadowundertop">
            </div>
            <!-- begin categories -->
            <div class="row space-bot">
                <div class="c12">
                    <h1 class="maintitle space-top">
                        <span>EXPLORE BEAUTY</span>
                    </h1>
                    <%--<div id="nav">
				<ul>
					<li><a href="" data-filter="*" class="selected">All Items</a></li>
					<li><a href="" data-filter=".cat1">Category 1</a></li>
					<li><a href="" data-filter=".cat2">Category 2</a></li>
					<li><a href="" data-filter=".cat3">Category 3</a></li>
				</ul>
			</div>--%>
                </div>
            </div>
            <!-- end categories -->
            <div class="row space-top">
                <div id="content">
                    <!-- box 1 -->
                    <asp:Repeater ID="GalleryRptr" runat="server">
                        <ItemTemplate>
                            <div class="boxthreecolumns">
                                <div class="boxcontainer">
                                    <a href="#">
                                        <%--<img src="http://placehold.it/400x200&text=any.size.you+wish" alt="">--%>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' />
                                    </a>
                                    <h1><a href="#"><%#Eval("Title") %></a></h1>
                                    <p>
                                        <%#Eval("Description") %>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- box 2 -->
                    <%--<div class="boxthreecolumns cat1">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 3 -->
			<div class="boxthreecolumns cat2 cat3">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 4 -->
			<div class="boxthreecolumns cat1">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 5 -->
			<div class="boxthreecolumns cat2">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 6 -->
			<div class="boxthreecolumns cat2">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 7 -->
			<div class="boxthreecolumns cat2 cat3">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 8 -->
			<div class="boxthreecolumns cat1">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>
			<!-- box 9 -->
			<div class="boxthreecolumns cat2 cat3">
				<div class="boxcontainer">
					<a href="#"><img src="http://placehold.it/400x200&text=any.size.you+wish" alt=""></a>
					<h1><a href="#">Studio Paul</a></h1>
					<p>
						 porta acean pulvinar
					</p>
				</div>
			</div>--%>
                    <!-- box 10 etc -->

                </div>
            </div>
        </div>
        <!-- end grid -->
        <!-- FOOTER
================================================== -->
        <div id="wrapfooter">
            <div class="grid">
                <div class="row" id="footer">
                    <!-- to top button  -->
                    <p class="back-top floatright">
                        <a href="#top"><span></span></a>
                    </p>
                    <!-- 1st column -->
                    <div class="c3">
                        <img src="images/ConsultancyLogo.png" alt="">
                    </div>
                    <!-- 2nd column -->
                    <div class="c3">
                        <h2 class="title"><i class="icon-twitter"></i>Follow us</h2>
                        <hr class="footerstress">
                        <ul class="" style="margin-top: 15px;">
                            <li class="">
                                <a href="https://www.instagram.com/carriermakers_jk/" target="_blank" title="Follow Us on Instagram"><img src="images/instagram.png" /></a>
                            </li>
                            <li class="">
                                <a href="https://www.facebook.com/Carrier-Makers-Consultancy-1866385860339067/?modal=admin_todo_tour" class="has-tip" target="_blank" title="Join us on Facebook"><img src="images/facebook.png" /></a>
                            </li>
                           
                        </ul>                 
                    </div>
                    <!-- 3rd column -->
                    <div class="c3">
                        <h2 class="title"><i class="icon-envelope-alt"></i>Contact</h2>
                        <hr class="footerstress">
                        <dl>
                            <dt>Kupwara kashmir,Pin:- 193222.</dt>
                            <dd><span>Mobile:</span>+91 7006305281</dd>
                            <dd>E-mail:  info@carriermakers.com</dd>
                        </dl>
                        
                    </div>
                    <!-- 4th column -->
                    <div class="c3">
                        <h2 class="title"><i class="icon-link"></i>Links</h2>
                        <hr class="footerstress">
                        <ul>
                            <li><a href="ContactUs.aspx">Contact</a></li>
                            <li><a href="Gallery.aspx">Gallery</a></li>
                            <li><a href="AdmissionForm.aspx">Admission Form</a></li>                            
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="../Admin/Login.aspx"><i class="icon-user-md"></i></a></li>
                        </ul>
                    </div>
                    <!-- end 4th column -->
                </div>
            </div>
        </div>
        <!-- copyright area -->
        <div class="copyright">
            <div class="grid">
                <div class="row">
                    <div class="c6">
                        &copy; 2017. All Rights Reserved.
		
                    </div>
                    <div class="c6">
                        <span class="right">Developed By:- <a href="http://www.kunalsofttech.com" style="color:green;text-decoration:underline;" target="_blank"><b>Kunal Soft-Tech</b></span>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <!-- END CONTENT AREA -->
    <!-- JAVASCRIPTS
================================================== -->
    <!-- all -->
    <script src="js/modernizr-latest.js"></script>

    <!-- menu & scroll to top -->
    <script src="js/common.js"></script>

    <!-- cycle -->
    <script src="js/jquery.cycle.js"></script>

    <!-- twitter -->
    <script src="js/jquery.tweet.js"></script>

    <!-- filtering -->
    <script src="js/jquery.isotope.min.js"></script>

    <!-- CALL filtering & masonry-->
    <script>
        $(document).ready(function () {
            var $container = $('#content');
            $container.imagesLoaded(function () {
                $container.isotope({
                    filter: '*',
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false,
                    }
                });
            });
            $('#nav a').click(function () {
                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false,
                    }
                });
                return false;
            });
            $('#nav a').click(function (event) {
                $('a.selected').removeClass('selected');
                var $this = $(this);
                $this.addClass('selected');
                var selector = $this.attr('data-filter');
                $container.isotope({
                    filter: selector
                });
                return false; // event.preventDefault()
            });
        });
 </script>

    <!-- Call opacity on hover images-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".boxcontainer img").hover(function () {
                $(this).stop().animate({ opacity: "0.6" }, 'slow');
            },
            function () {
                $(this).stop().animate({ opacity: "1.0" }, 'slow');
            });
        });
</script>
</body>
</html>
