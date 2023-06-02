<script>
	import CtComponent from "$lib/ctComponent.svelte";

</script>


<div class="background">
	<div class="ball" />
	<div class="ball" />
	<div class="container">
		<div class="ball3" />
	</div>
	<img src="profilePic_circleBg.png" alt="pfp" />

	<div class="flex">
		<div class="text">
			<div class="hello">Hello, I’m</div>
			<div class="name">Rushi Patil</div>
			<div class="developer">I’m a fullstack developer</div>
			<div class="description">
				Lorem Ipsum is simply dummy text of the .printing and typesetting industry. Lorem Ipsum has
				been the industry's standard dummy
			</div>
			<button class="button1">More about me</button>
		</div>

		<!-- <div class="mobile">
		<div class ='ct'><CtComponent/></div>	

			<img class="myMobile" src="mobile1.png" alt="mobile" />
		</div> -->

		
<div class="smartphone">
	<div class="content">
		<CtComponent/>
	  <!-- <iframe src="/w3css/tryw3css_templates_band.html" title = "iframe" style="width:100%;border:none;height:100%" /> -->
	</div>
  </div>
	</div>
</div>


<style>

.smartphone {
  position: relative;
  left: 420px;
  top:120px;
  width: 15vw;
  height: 50vh;
  margin: auto;
  border: 16px black solid;
  border-top-width: 60px;
  border-bottom-width: 60px;
  border-radius: 36px;
}

/* The horizontal line on the top of the device */
.smartphone:before {
  content: '';
  display: block;
  width: 60px;
  height: 5px;
  position: absolute;
  top: -30px;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #333;
  border-radius: 10px;
}

/* The circle on the bottom of the device */
.smartphone:after {
  content: '';
  display: block;
  width: 35px;
  height: 35px;
  position: absolute;
  left: 50%;
  bottom: -65px;
  transform: translate(-50%, -50%);
  background: #333;
  border-radius: 50%;
}

/* The screen (or content) of the device */
.smartphone .content {
	width: 15vw;
  height: 50vh;
  background: white;
}
	/* .mobile {
		z-index: 3;
	}
	.myMobile{
		position: absolute;
		z-index: 4;
		
		height: 92vh;
		width: 25vw;
		right : 5%;
		background-color: red;

	}

	 .ct {
		position: absolute;
		z-index: 5;

		right : 5%;
		top:5%;
		/* height: 85vh;
		width: 25vw; */
		
	/* }  */

	.flex {
		display: flex;
		justify-content: end;
	}
	.button1 {
		background-color: black;
		color: white;
		border-radius: 6px;
		margin-top: 30px;
		padding: 10px 20px;
		border: none;
		cursor: pointer;
		font-size: 13px;
	}
	.developer {
		font-size: 20px;
		font-weight: bold;
		color: #433a51;
	}

	.name {
		font-size: 85px;
		font-weight: bold;
		color: #190061;
	}

	.hello {
		font-size: 15px;
		/* font-weight: bold; */
		color: #808080;
	}
	.description {
		padding-top: 20px;
		width: 450px;
		font-size: 13px;
		font-weight: bold;
		color: #aaa9ad;
	}
	.text {
		position: absolute;
		left: 30%;
		top: 35%;
		justify-content: center;
		font-family: 'Arial', sans-serif;
	}

	.background {
		width: 100%;
		height: 100vh;
		position: relative;
	}

	.ball {
		position: absolute;
		border-radius: 50%;
	}

	.ball:nth-child(1) {
		z-index: -1;
		top: -10%;
		left: -5%;
		width: 200px;
		height: 200px;
		border-radius: 50%;
		background: linear-gradient(148.01deg, #ff2f004d, #ff2f004d, #cf47ff);
	}

	.ball:nth-child(2) {
		z-index: -2;
		top: -20%;
		left: 60%;
		width: 320px;
		height: 320px;
		background: linear-gradient(148.01deg, #ffbb0060, #cf47ff);
	}

	/* .ball:nth-child(3) {
		z-index: 2;
		bottom: 0%;
		right: 0%;
		width: 400px;
		height: 400px;
		overflow :hidden;
		background: linear-gradient(148.01deg, #FF2F0017, #ff2f004d, #cf47ff);
		/* transform: translate(50%, -50%); */

	/* } */

	.container {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}

	.ball3 {
		position: absolute;
		border-radius: 50%;
		width: 600px;
		height: 600px;
		background: linear-gradient(148.01deg, #ff2f0017, #ff2f004d, #cf47ff);

		right: -10%;
		bottom: -40%;
		/* transform: translate(50%, -50%); */
	}

	/* .ball:nth-child(4) {
		z-index: 1;
		bottom: 0%;
		/* right: -10%; */
	/* width: 200px;
		height: 200px;
		overflow: hidden;
		background: linear-gradient(148.01deg, #FF2F0017, #ff2f004d, #cf47ff); */
	/* } */

	.background img {
		position: absolute;

		z-index: -3;
		/* width: 100%; */
		height: 500px;
		bottom: 0%;
	}
</style>
