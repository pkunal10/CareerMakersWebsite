<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserWithSlider.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <title>Carrier Makers Consultancy</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="clearfix"></div>
        <div class="grid">
	<div class="row space-bot">
		<!--INTRO-->
		<div class="c12">
			<div class="royalcontent">
				<h1 class="royalheader">WELCOME TO CARRIER MAKERS CONSULTANCY</h1>
				<%--<h1 class="title" style="text-transform:none;">Html theme with awesome features, sliders, unlimited colors & much more!</h1>--%>
			</div>
		</div>
        <div class="c2"></div>
		<!--Box 1-->
		<div class="c4">
			<h2 class="title hometitlebg"><i class="icon-building smallrightmargin"></i> Admission</h2>
			<div class="noshadowbox">
				<h5>Admission</h5>
				<p>
					 We provide admissions in different different courses in best colleges.
				</p>
				<p class="bottomlink">
					<a href="#" class="neutralbutton"><i class="icon-eye-open"></i></a>
				</p>
			</div>
		</div>
		<!--Box 2-->
		<div class="c4">
			<h2 class="title hometitlebg"><i class="icon-user-md smallrightmargin"></i> Job Offer</h2>
			<div class="noshadowbox">
				<h5>Job Offer</h5>
				<p>
					 We provide all type of jobs.you get your desired job from Carrier Makers Consultancy.
				</p>
				<p class="bottomlink">
					<a href="#" class="neutralbutton">
                        <i class="icon-eye-open"></i></a>
				</p>
			</div>
		</div>
		<!--Box 3-->
		<%--<div class="c4">
			<h2 class="title hometitlebg"><i class="icon-user" style="margin-right:10px;"></i> MultiPurpose Use</h2>
			<div class="noshadowbox">
				<h5>PRICING</h5>
				<p>
					 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam hendrerit lacus mattis orci fermentum mollis iaculis purus lobortis. In et purus ut nunc elementum dapibus facilisis in quam.
				</p>
				<p class="bottomlink">
					<a href="#" class="neutralbutton"><i class="icon-link"></i></a>
				</p>
			</div>
		</div>--%>
        <div class="c2"></div>
	</div>
	<!-- SHOWCASE
	================================================== -->
	<div class="row space-top">
		<div class="c12 space-top">
			<h1 class="maintitle ">
			<span>PHOTOS</span>
			</h1>
		</div>
	</div>
	<div class="row space-bot">
		<div class="c12">
			<div class="list_carousel">
				<div class="carousel_nav">
					<a class="prev" id="car_prev" href="#"><span>prev</span></a>
					<a class="next" id="car_next" href="#"><span>next</span></a>
				</div>
				<div class="clearfix">
				</div>
				<ul id="recent-projects">
					<!--featured-projects 1-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/1231.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 2-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/consultancy.png" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 3-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/job-offer.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 4-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/JobsAbroad.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 5-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/work_abroad.png" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>
						
					</div>
					</li>
					<!--featured-projects 6-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/CollegeStudents.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 7-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/Engineering-students.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
					<!--featured-projects 8-->
					<li>
					<div class="featured-projects">
						<div class="featured-projects-image">
							<a href="#"><img src="images/Home/admission.jpg" style="width:275px;height:180px;" class="imgOpa" alt=""></a>
						</div>						
					</div>
					</li>
				</ul>
				<div class="clearfix">
				</div>
			</div>
		</div>
	</div>
	<!-- CALL TO ACTION 
	================================================== -->
	<%--<div class="row space-bot">
		<div class="c12">
			<div class="wrapaction">
				<div class="c9">
					<h1 class="subtitles">Salique is incredibly awesome, with a refreshingly clean design</h1>
					 We produce comprehensive mapping of consumers' relationships with communications across bought, owned & earned media based on bespoke insight. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam hendrerit lacus mattis orci fermentum mollis iaculis.
				</div>
				<div class="c3 text-center" style="margin-top:40px;">
					<div class="actionbutton">
						<i class=" icon-download-alt"></i> DOWNLOAD NOW
					</div>
				</div>
			</div>
		</div>
	</div>--%>
</div><!-- end grid -->
    
</asp:Content>

