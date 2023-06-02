<script>
	// import MyHeader from './myHeader.svelte';
</script>

<div class="outer">
	<!-- <MyHeader /> -->

	<div class="bg">
		<div class="flex1">
			<div class="circle1" />
			<img src="profilePic_circleBg.png" alt="pfp" />
		</div>
		<div class="flex2" />
		<div class="flex3">
			<div class="circle2" />
			<div class="circle3" />
		</div>
	</div>
</div>

<style>
	.outer {
		width: 100vw;
		position: absolute;
		z-index: 0;
		/* background-color: red; */
	}

	.bg {
		position: relative;
		z-index: 1;
		display: flex;
		flex-direction: row;
		height: 100vh;

		/* background-color: aqua; */
	}

	.flex1 {
		display: flex;
		flex-direction: column;
		flex: 1;
	}
	.flex2 {
		display: flex;
		flex-direction: column;
		flex: 1;
		background: rebeccapurple;
	}
	.flex3 {
		display: flex;
		flex-direction: column;
		flex: 1;
	}

	.circle1 {
		flex: 4;

		position: relative;
		/* z-index: 1; */

		/* bottom:25%; */
		right: 12%;
		width: 200px;
		height: 200px;
		border-radius: 50%;
		background: linear-gradient(to bottom, #ff2f004d, #ff2f004d, #cf47ff);
	}

	.flex1 img {
		flex: 6;
		width: 80%;
		/* aspect-ratio: 1; */
		/* height: 85%; */
	}

	.circle2 {
		right: 12%;
		width: 200px;
		height: 200px;
		border-radius: 50%;
		background: linear-gradient(148.01deg, rgba(255, 46, 0, 0.08) 15.95%, #cf47ff 88.64%);
	}

	.circle3 {
		width: 100vh;
		height: 100vh;
		max-width: 100%;
		max-height: 100%;
		border-radius: 50%;
		background-color: #f00;
		overflow: hidden;
	}
</style>
